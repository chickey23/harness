# Harness workflow — operating model

Provisional, 2026-11-16. Non-normative: records how the harness operates. Requirements live in
the spec corpus (`C:\Project`); this document cites it by identifier, it does not restate it.

## Scope

The harness exists to **refine toward a prompt**. The object under refinement is the prompt
itself; implementations are disposable evidence produced along the way. The unit of iteration is
the **entire application**: one cycle builds a complete implementation and scores it.

## The rubric

Cycles are judged against a **common rubric**, which is expected to evolve; every scored cycle
records which rubric revision judged it.

The default rubric is **local to this workspace** ([`rubric.md`](rubric.md)) and minimal: user
satisfaction, with **user ranking required** — the user ranks results across a project rather
than only scoring each in isolation. Richer criteria are added as needed.

Scoring: the owner may be asked to score on a number of chosen criteria. Machine assessment of
objective criteria is planned for — enabled by amending the prompt to require **accessible
logging of the desired criteria**, with JEV-type judge models anticipated. The criteria list is
stated **per direction**, defaults to the previous direction's list, and may be derived from
previous scoring. Until the `EvaluationModel` publication exists
(`MigrateInbound/InstructionsForEvaluationModel.txt` — a reserved slot, provisional), the rubric
is informal and versioned only by its own revisions.

## Project intake

At project intake, derive a candidate **scenario suite** from the project corpus —
the prompt's observable demonstrations, user-experience reference scenarios, and
prior builds' test conventions — and propose it for owner's approval. The suite lives
project-side; the harness imports and syncs it at review points, it does not own it.
(Amendment H1, adopted 2026-11-20 — finding F11.)

From the suite, **pathed scenarios** (`P-*`) may be synthesized — ordered interaction
workflows whose steps compose scenarios and enumerate interface items by normative
`module.affordance` naming. Building them and checking for gaps follows
[`pathed-scenarios.md`](pathed-scenarios.md); unconsolidated scenarios are tolerated
but recorded as gap signs. (Owner direction 2026-11-27.)

## Operating modes

- **Scoring run** — the default. With no criteria given to optimize, a cycle simply scores the
  build against the current rubric.
- **Guided evolution** — a human direction names a region or variable to improve and a budget of
  cycles; the harness runs that many iterations between human reviews. A direction may specify
  several competing approaches ("try three different approaches to improve time from application
  launch until user voice recognition"), a single variable ("try loading seed data before and
  after local data"), or a measurement question ("try cloud storage for the user data and see how
  much longer it takes to access").

Each direction also fixes the **baseline**: build fresh from the prompt, or modify-and-measure
from a chosen prior implementation — decided per command, not by standing rule. When several
approaches are wanted, the agent proposes candidates and the owner picks at review.

The cycle budget is set per direction. A failed cycle is recorded in the log; failure does not
trigger an automatic rebuild.

Human review is the fixed point. At times a single build-and-compare is the whole run; as the
harness matures, the number of cycles between reviews is expected to grow. Directions and rubric
revisions arrive only at review points.

At each review, named suite scenarios with no enactment evidence are flagged as
evidence gaps. An anticipated scenario is notable in its absence; a cycle that never
enacts a named scenario is a finding, not neutral. (Amendment H2, adopted
2026-11-20 — finding F11.)

## Cycle gate

A direction is **clarified sufficiently** before cycles run — sufficiency, not exhaustion.
Ambiguous statements are **rejected as inadequate** rather than run. Exhaustive clarification
remains the developer's discipline for spec and document work (see `../AGENTS.md`); the cycle
gate is lighter because cycles are cheap to discard.

## Scenario checks

Before a cycle runs, the coordinator verifies that every scenario the direction names has a
**present check or test** the build can be enacted against. Where tests are needed and absent,
the direction requires the build to create them — a named scenario with no checkable surface is
an adequacy gap in the direction, not a discovery for the JEV. At review, named-but-unchecked
scenarios join named-but-unenacted ones as findings. (Owner direction 2026-11-25.)

## The prompt evolves too

The prompt is versioned and changes over time. Results from cycles run under different prompt
revisions can still be compared, but they compare different things than implementation-only
changes. The log records which prompt each cycle ran under so a reviewer knows which kind of
comparison they are making.

`prompt.md` is **refreshed at the start of every cycle** — re-snapshotted even when the corpus
revision is unchanged, and amended to record that it is being reused. Each revision carries a
**preamble**: a version identifier, the assembly timestamp, an assembled-from list naming every
source document with its own revision date, and the cycle(s) that executed under it.

The prompt is **assembled from an examination of the source documentation**, not a single-file
copy. The coordinator re-scans the corpus at each assembly for guiding documents a build must
see — for the `project` line this means `ProjectPrompt.md` plus the `Design/` steering tier
(`INTENTS.md`, `MAXIMS.md` embedded; `Papers/` and `*_explained` commentaries cited as depth) —
so steering reaches the build by residency in the artifact it must read, not only by kickoff
naming. Assembly composes corpus *revisions* project-side; the corpus's own revision process
still owns what enters `C:\Project`. (Owner direction 2026-11-25.)

Results inform prompt revisions at review points: **the harness session drafts proposed
amendment text; the user edits and approves.** Revisions are adopted through the spec corpus's
own revision process in `C:\Project` — the harness never applies them itself. The intention is
to develop the workflow here and apply it there: `C:\Project` will be updated
(e.g. `D-DevelopmentHarness`, the accessible-logging requirement) before the harness is run.

## Development log

Each project keeps a **continuous development log in its own project folder** — not in this
workspace. Each cycle appends an entry containing:

- a reference to the prompt (form determined per project — usually the prompt text included at
  the end of the document, or a citation into another version-controlled document store);
- the evaluation criteria applied (rubric identity and revision);
- the results;
- the user directions that governed the cycle;
- session start and end at cycle close (for `time to implement`), and which suite
  scenarios were named among the criteria. (Amendment H4, adopted 2026-11-20 —
  finding F10.)
- **build time, two measures** (owner ruling 2026-11-25): `Calendar span` —
  build date → build date (cycle cadence, includes review/idle gaps); and
  `LLM build time` — clock time the model is actively working inside the build
  phase (session-span approximation is acceptable — owner 2026-11-25). Both
  tracked, neither scored; recorded in the cycle entry and the
  `builds[]` row of `state.json` (`llm_build_time`, null when not captured).

A project folder holds **a line of development**: the implementations and variants its cycles
produce, plus the log. Log closure is **user-directed** — points of no return (completion,
splits) are owner calls, not automatic triggers. A split is a new start: a new project folder
with its own log. A project may keep an index of its own lines and variants inside the project,
for reference; it is not authoritative.

## Derivative documents

Cycles produce documents that steer work without being the prompt — directions,
findings, convention sets, suite revisions, amendment proposals. Each is a
**derivative doc**: created draft, ruled on by the owner, consumed or adopted,
superseded. Its state is harness-visible machinery, not prose buried in its own
header paragraph. (Adopted 2026-11-25 — owner finding: unapproved derivatives
and their states were untrackable and unnameable.)

**Status vocabulary** — one chain for every kind:

    draft → proposed → approved → in-force → discharged | adopted-upstream
                          ↘ superseded · rejected (terminal, from any state)

- `draft` — being written; `proposed` — before the owner for a ruling;
  `approved` — ruled, not yet steering a cycle; `in-force` — actively steering
  (direction with unspent budget, the live suite, a promoted convention set);
  `discharged` — ran its course (spent direction; findings mapped into the
  suite/conventions — `mapped-into` required); `adopted-upstream` — absorbed by
  `C:\Project` or `C:\Harness` under their own revision processes.
- **Unapproved = `draft | proposed`** — enumerable, not remembered.

**Doc kinds** — filename pattern → kind:

| Pattern | Kind | Usual terminal states |
|---|---|---|
| `direction-NNN.md` | direction | `discharged` (spent), `superseded` |
| `shortcomings-NNN.md` | shortcomings | `discharged` (`mapped-into` required) |
| `conventions-NNN.md`, `decision-candidates-NNN.md` | conventions | `adopted-upstream`, `superseded` |
| `*-amendments-NNN.md` | amendments | `adopted-upstream`, `rejected`, `superseded` |
| `*-sweep-NNN.md` | analysis | `discharged`, `superseded` |
| `scenarios.md`, `scenario-*.md` | suite | `superseded` |
| `configured-sources-NNN.md`, `*-seed-NNN.md` | seed | `superseded` (next seed revision) |
| `impl-design-NNN.md` | impl-design | `superseded` (next revision — implementation design, working tier, continuously improved) |
| `prompt.md` | prompt | `superseded` (next snapshot) |
| `devlog.md` | log | — (`in-force` always) |
| `AGENTS.md`, `README.md` | — | exempt from the register |

**Status header.** Every derivative doc carries one machine-readable line in its
first lines:

    <!-- harness-doc kind=shortcomings status=approved since=2026-11-25
         applies-to=cycle-6 mapped-into=scenarios.md,conventions-004.md -->

`kind` and `status` are required; `since`, `applies-to`, `supersedes`,
`mapped-into`, `provisional-ids=true` are optional. The coordinator writes the
header at creation and updates `status=` in the **same edit** as the owner
action that changes it — state change is not a later bookkeeping pass.

**Register.** `.devin/register.json` is **generated by scanning headers**
(`register-scan.ps1`), never hand-maintained — the display rule applied to doc
state: derive from artifacts that must exist anyway. It answers "what is
unapproved" and "what is in force" as a query. Reference form for owner and
coordinator alike is **id + status word** (`conventions-004: in-force,
provisional-ids`) — the register is the shared vocabulary.

## Locations

| Location | Holds |
|---|---|
| `C:\Harness` | Harness-specific documents only |
| `C:\harness-ops` | the ops/coordinator home — sessions run here, deployed tooling lives here (adopted 2026-11-23) |
| `C:\builds` | the builds root — project folders live beneath it; a folder carrying `.devin/` machinery + `devlog.md` is a project |
| `C:\Other Projects` | dev/test data for this project |
| `C:\Project` | the normative spec corpus — cited, not mirrored |

The owner still points the harness at each project folder, but `C:\builds` is the scan
root (adopted 2026-11-23): tooling — the status display, any fleet view — discovers
projects by machinery presence rather than being told their paths.
