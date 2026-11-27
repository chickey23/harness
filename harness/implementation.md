# Harness implementation — Devin CLI realization

Provisional, 2026-11-18. Non-normative: the current concrete realization of
[`workflow.md`](workflow.md). This is replaceable machinery — the operating model does not
depend on it — recorded so a project folder knows what to carry.

## Roles

- **Coordinator session** — the interactive Devin session the owner talks to, in whatever folder
  the owner opened it (the coordinator home — usually, not necessarily, the project folder).
  Receives directions, applies the cycle gate (clarify sufficiently; reject ambiguous), drives
  the per-direction cycle budget, and drafts prompt-amendment proposals at review.
- **Build session(s)** — disposable Devin sessions running in the project folder. Each cycle
  iterates the entire application (fresh build or modify-and-measure, per the direction's
  baseline). Spawned **detached** — see "Build spawn" below; the coordinator never holds a
  synchronous wait on a build.
- **JEV session** — the judge/evaluator, realized as a **separate single-turn session**
  (`devin -p`) per scoring event — not a subagent of the build session, keeping judge and
  builder isolated by construction.

## Judge (JEV) configuration

- **Model:** pinned to a cheap fast model (default the `swe` family — the named criteria are
  designed to be checkable, not subtle). Deliberately distinct from the builder's model.
  Escalation to a frontier model is reserved for contested verdicts.
- **Input:** the direction's named criteria plus the build's accessible evidence (the logs and
  artifacts the evaluability requirement in `ProjectPrompt.md` §Observable demonstrations
  obliges builds to emit).
- **Output:** a **JSON verdict appended to the development log** — criteria, scores, evidence
  citations, judge confidence, judge model identity. Machine-readable now; skimmable enough for
  the owner's review.

## Mechanical gates

Enforcement lives in the **project folder's `.devin/` config**, so the machinery travels with
the project rather than relying on documentation or global setup. Starter files ship in
[`templates/`](templates/):

- `UserPromptSubmit` hook (in `.devin/hooks.v1.json`) — the direction gate: injects gate
  requirements / rejects ambiguous directions as inadequate. Also regenerates
  `.devin/register.json` (via `register-scan.ps1`) and injects the register
  digest — pending approvals, in-force docs, provisional ids — so document state
  is in context on every prompt.
- `Stop` hook — the completion gate: blocks a build session from finishing before its devlog
  entry exists. Also blocks while a top-level `*.md` lacks a `harness-doc`
  status header — unregistered derivatives surface at creation, not at review.
- The judge role definition may also be kept as `.devin/agents/jev.md` (model pin, restricted
  tools, verdict contract) so the same definition can serve a future subagent path; the primary
  path is the separate `-p` session driven by `.devin/jev-prompt.md`.

A project folder therefore carries: `.devin/` config, `devlog.md`, and the implementation
itself — alongside the dev/test data in `C:\Other Projects`.

## The cycle, concretely

1. Owner issues a direction to the coordinator session; the gate hook and coordinator clarify
   it sufficiently (ambiguous → rejected as inadequate).
2. Build session(s) run the cycle — whole application, per the direction's baseline and
   approach selection.
3. The JEV `devin -p` session scores the emitted evidence; the JSON verdict is appended to
   `devlog.md` with prompt ref, criteria revision, results, and governing directions.
4. Repeat to the direction's budget. Failed cycles are logged, not auto-retried.
5. At review, the owner scores/ranks; the session drafts prompt amendments; the owner edits and
   approves for `C:\Project` adoption.

## Build spawn

Realized 2026-11-19+ in `C:\builds\project` as `.devin/acp-build-driver.py`: spawns
`devin acp`, authenticates via `authenticate._meta.api_key` (read from the stored
credentials file), opens or resumes a session in the project folder, auto-approves
permission requests, serves fs read/write callbacks, streams the full JSON-RPC log to
`.devin/*-cycle-*.acp.log`, and on turn end writes a status file
(`.devin/last-cycle-status.txt` / `last-jev-status.txt`) plus an audible bell so a
finished — or given-up — session is noticeable away from the chat. The same driver runs
JEV scoring sessions; env vars override prompt file, log, status file, session id, and
timeout. The coordinator fires a build and later reads results off the filesystem —
completion is file-observable because the Stop gate forces the devlog entry.

## Status display

Adopted 2026-11-23. A **read-only, file-derived** status surface over the builds root.
Design rule: the display derives from artifacts that must exist anyway — it never
relies on a session reporting status, and hook coverage gaps (no event fires when a
session dies mid-run) are bridged by inspecting files, not by trusting hooks.

### Architecture

- **Static shell + data payload.** Each project carries `display/` at the project level
  (above the per-build folders): an `index.html` + JS shell written once at birth, and a
  `data.js` payload (`window.HARNESS_DATA = {...}`) rewritten each scan. Pages open via
  `file://` — no server; `data.js` is reloaded by cache-busted script tag, not `fetch`.
- **Emitter:** PowerShell (`-Once` / `-Watch <sec>`, default 30). Scans `C:\builds` for
  folders carrying `.devin/` + `devlog.md`. Emits a fleet index at `C:\builds\index.html`
  plus each project's `display/data.js`.
- **Refresh:** the page reloads `data.js` every 30s while visible; on refocus, reloads
  only when the payload's generated-at stamp is newer than what is rendered.
- **Liveness** = seconds since the newest file mtime under the project, excluding
  `display/`, `.devin/` internals, and `.git/` — `devlog.md` appends count as activity.
  No heartbeat contract on builds. Driver status files are shown verbatim.

### Views

- **Fleet index** — one summary row per project (line, direction in force, budget spent,
  docs pending/in-force/unregistered, last verdict, liveness), linking down. No
  cross-project comparison.
- **Project summary** (default view) — `state.json` fields: prompt ref, direction in
  force + clarity status, budget, criteria, baseline, builds with timestamps, pending
  owner questions.
- **Documents** — the derivative-doc register: in-force set, pending approvals,
  provisional ids (pending corpus adoption), current-per-kind, full register table,
  unregistered top-level docs flagged as gaps (`workflow.md` §Derivative documents).
- **Comparison** — criteria line chart over cycles: one colored line per criterion,
  sparse (no point where a cycle wasn't scored on it); a **depth picker anchored at the
  latest** run ("show last N") since the newest build is nearly always in the comparison
  set; clicking a point opens build detail. Charts use a vendored single-file Chart.js
  (works over `file://`, native sparse-data handling). Below the chart, a
  **conventions/scenarios matrix** — id × cycle cells: `conformed` / `reckoned-departure`
  / `silent-departure` / `not-assessed` for conventions; score + evidence class for
  scenarios. An un-checked id renders as a visible gap — absence is a finding (H2).
- **Current state** — a live read of the C-\*/S-\* id sets and prompt revision from
  `C:\Project`: what the *next* cycle would be judged under, distinct from the
  per-direction snapshots recorded in `state.json`.
- **Build detail** — timestamps, the verdict JSON, evidence citations, and a **launch
  pointer** to the build's emitted launcher artifact (the C-LauncherTests pattern:
  launcher shortcuts with env baked). Wired only for the most recent run.

### Data sources

| Data | Derived from |
|---|---|
| Verdicts (criteria, metrics, scenarios, conventions) | fenced JSON in `devlog.md` cycle entries; `.devin/jev-cycle-*.out` as raw fallback |
| Direction in force, budget, pending questions | `.devin/state.json` |
| Document register (pending, in-force, provisional, unregistered) | `harness-doc` headers on top-level `*.md`, scanned directly — same source `.devin/register.json` derives from |
| Build liveness | newest in-scope mtime + `.devin/last-*-status.txt` |
| Convention/scenario id sets | `C:\Project` live read (current-state view); per-direction snapshot in `state.json` |
| Launch pointer | the latest build's emitted launcher artifact |

### `state.json`

The coordinator's externalized working state — the artifact that answers "what is
already known" before anyone asks. Written at intake and when the gate accepts a
direction (the two hook-enforceable moments). Fields: line name; prompt ref; direction
in force (ref, clarity status, budget total/spent, criteria, baseline); builds (cycle,
dir, session id, approach, started/ended); pending owner questions; revision snapshots
(prompt, conventions, scenarios). Template: `templates/state.json`.

Coordinator contract — **experimental** (2026-11-23; to be refined through the skills
work, not yet a gate): on every owner prompt, read `state.json`, show its summary, then
ask only for the delta. Intended to kill redundant intake questions and front-load the
data the owner needs. Document state rides the same channel: the direction gate
injects the `register.json` digest (pending / in-force / provisional ids) on
every prompt, and owner + coordinator refer to docs by **id + status word**
(`workflow.md` §Derivative documents).

### Provisioning

The display tool is itself a harnessed line of development: `C:\builds\harness-ui`,
built fresh-from-prompt per cycle like any other. The working emitter + shell is
mirrored into `templates/display/` so future projects carry it at birth (first
mirror 2026-11-25, incl. the derivative-doc register derivation). Manual edits to
the deployed emitter/shell between cycles are recorded here, not in the build's
own cycle entry — the register views were added this way.

## Not yet settled

- The check logic inside the hooks (what makes a direction "ambiguous" or a log entry
  "present") — evolves per project with use.
- Whether a low judge confidence triggers automatic frontier-model escalation or is simply
  flagged for the owner.
- How the coordinator contract is enforced — direction-gate injection vs skill/runbook
  guidance; deliberately experimental for now.
- Cloud sessions for unattended multi-cycle runs — deferred until local runs are stable.
