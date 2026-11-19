# Harness implementation — Devin CLI realization

Provisional, 2026-11-18. Non-normative: the current concrete realization of
[`workflow.md`](workflow.md). This is replaceable machinery — the operating model does not
depend on it — recorded so a project folder knows what to carry.

## Roles

- **Coordinator session** — the interactive Devin session the owner talks to. Receives
  directions, applies the cycle gate (clarify sufficiently; reject ambiguous), drives the
  per-direction cycle budget, and drafts prompt-amendment proposals at review.
- **Build session(s)** — disposable Devin sessions running in the project folder. Each cycle
  iterates the entire application (fresh build or modify-and-measure, per the direction's
  baseline).
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
the project rather than relying on documentation or global setup:

- `UserPromptSubmit` hook — the direction gate: injects gate requirements / rejects ambiguous
  directions as inadequate.
- `Stop` hook — the completion gate: blocks a build session from finishing before its devlog
  entry exists.
- The judge role definition may also be kept as `.devin/agents/jev.md` (model pin, restricted
  tools, verdict contract) so the same definition can serve a future subagent path; the primary
  path is the separate `-p` session.

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

## Not yet settled

- The check logic inside the hooks (what makes a direction "ambiguous" or a log entry
  "present") — evolves per project with use.
- Whether a low judge confidence triggers automatic frontier-model escalation or is simply
  flagged for the owner.
- Cloud sessions for unattended multi-cycle runs — deferred until local runs are stable.
