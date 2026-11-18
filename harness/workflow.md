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

The default rubric is **local to this workspace** and minimal: user satisfaction, with **user
ranking required** — results are ranked by the user, not only scored. Richer criteria are added
as needed.

Scoring: the owner may be asked to score on a number of chosen criteria. Machine assessment of
objective criteria is planned for — enabled by amending the prompt to require **accessible
logging of the desired criteria**, with JEV-type judge models anticipated for machine-assessable
criteria. Until the `EvaluationModel` publication exists
(`MigrateInbound/InstructionsForEvaluationModel.txt` — a reserved slot, provisional), the rubric
is informal and versioned only by its own revisions.

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

## Cycle gate

A direction is **clarified sufficiently** before cycles run — sufficiency, not exhaustion.
Ambiguous statements are **rejected as inadequate** rather than run.

## The prompt evolves too

The prompt is versioned and changes over time. Results from cycles run under different prompt
revisions can still be compared, but they compare different things than implementation-only
changes. The log records which prompt each cycle ran under so a reviewer knows which kind of
comparison they are making.

Results inform prompt revisions at review points. Revisions are adopted through the spec
corpus's own revision process in `C:\Project` — the harness never applies them itself. The
intention is to develop the workflow here and apply it there: `C:\Project` will be updated
(e.g. `D-DevelopmentHarness`, the accessible-logging requirement) before the harness is run.

## Development log

Each project keeps a **continuous development log in its own project folder** — not in this
workspace. Each cycle appends an entry containing:

- a reference to the prompt (form determined per project — usually the prompt text included at
  the end of the document, or a citation into another version-controlled document store);
- the evaluation criteria applied (rubric identity and revision);
- the results;
- the user directions that governed the cycle.

A project folder holds **a line of development**: the implementations and variants its cycles
produce, plus the log. Log closure is **user-directed** — points of no return (completion,
splits) are owner calls, not automatic triggers. A split is a new start: a new project folder
with its own log. An index of project lines may be maintained locally for reference; it is not
authoritative.

## Locations

| Location | Holds |
|---|---|
| `C:\Harness` | Harness-specific documents only |
| each project folder | a line of development: its implementations + the development log |
| `C:\Other Projects` | dev/test data for this project |
| `C:\Project` | the normative spec corpus — cited, not mirrored |

The owner points the harness at each project folder; there is no discovery or naming convention.
