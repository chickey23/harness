# Harness workflow — operating model

Provisional, 2026-11-16. Non-normative: records how the harness operates. Requirements live in
the spec corpus (`C:\Project`); this document cites it by identifier, it does not restate it.

## Scope

The harness exists to **refine toward a prompt**. The object under refinement is the prompt
itself; implementations are disposable evidence produced along the way. The unit of iteration is
the **entire application**: one cycle builds a complete implementation and scores it.

## The rubric

Cycles are judged against a **common rubric**. The rubric is expected to evolve; every scored
cycle records which rubric revision judged it. Until the `EvaluationModel` publication exists
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

Human review is the fixed point. At times a single build-and-compare is the whole run; as the
harness matures, the number of cycles between reviews is expected to grow. Directions and rubric
revisions arrive only at review points.

## The prompt evolves too

The prompt is versioned and changes over time. Results from cycles run under different prompt
revisions can still be compared, but they compare different things than implementation-only
changes. The log must record which prompt each cycle ran under so a reviewer knows which kind of
comparison they are making.

## Development log

Each project keeps a **continuous development log in its own project folder** — not in this
workspace. Each cycle appends an entry containing:

- a reference to the prompt (usually the prompt text included at the end of the document, or a
  citation into another version-controlled document store);
- the evaluation criteria applied (rubric identity and revision);
- the results;
- the user directions that governed the cycle.

The log charts one line of development. At **points of no return** a log closes and a new one
opens: a well-scoped project reaches that point at completion, but projects often split — a split
starts a new project folder with its own log.

## Locations

| Location | Holds |
|---|---|
| `C:\Harness` | Harness-specific documents only |
| each project folder | one implementation + its development log |
| `C:\Other Projects` | dev/test data for this project |
| `C:\Project` | the normative spec corpus — cited, not mirrored |
