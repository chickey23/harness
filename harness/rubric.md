# Local rubric — default scoring criteria

Provisional, 2026-11-16. Non-normative: the working rubric referenced by
[`workflow.md`](workflow.md). It evolves at review points; every development-log entry cites the
revision that judged it.

## Default criteria

- **User satisfaction** — the build satisfies the user's stated directions and the prompt's
  required behavior.
- **User ranking (required)** — the user ranks results across a project — the accumulated
  candidates of a line of development — rather than only scoring each in isolation.
- **Existing features** — failure to enact previously demonstrated features remains
  scored.
- **Completeness** — fraction of prompt-required behavior delivered, weighted toward
  required over optional. (Amendment H3, adopted 2026-11-20.)
- **Scenario suite** — the project's named suite, each scenario scored 0–1 on ability
  to enact, with `enactment` vs `repository` evidence class distinguished; canonical
  scenarios require enactment-class evidence for enactment credit. (H3.)
- **Time to implement** — tracked, not scored: elapsed wall-clock between successive
  versions in a line, all composition recorded. (H3.)

`new features` was removed from the default set (rubric revision 2026-11-19): not a
good indicator — completeness absorbs its useful content. Directions may still name it
or any other criterion explicitly; the criteria list stays per-direction, defaulting
to the previous direction's list.

## Criterion kinds

Every scored criterion is one of three kinds (rubric revision 2026-11-27):

- **Measured** — the score reports a measurement of enumerated evidence: check counts,
  scenario pass ratios, raw timings in seconds (tenths where reasonable). The verdict
  carries `measure` (raw value + unit) and `method` (how it was taken). The number is
  the number: review may rule a measurement absent or failed, but neither judge nor
  owner restyles it into an opinion; enumerated tests themselves are not altered by
  review. Time-based criteria are measured in seconds, not scored 0–1.
- **Evaluated** — the judgment layer. The scorer emits a 0–1 score plus a `confidence`
  ranking expressing how confident the evaluator is in that score — the field exists
  because these values are uncertain by nature. Owner opinions on evaluated criteria
  are vibes-based highlights, not audits; an untouched criterion is *unreviewed*, its
  judge score read as provisional.
- **User** — scores the user entered (e.g. satisfaction, ranking). The judge emits
  `null`; the owner's figure lands in `user_opinion` and is taken as indicative of
  user opinion on the topic, not as a measurement.

Directions declare which named criteria are measured vs evaluated and, for measured
criteria, the measurement method the build must log accessibly.

## Machine-assessable criteria

- Each direction may name **desired criteria** that builds must log accessibly, so they can be
  scored by machine later. The list defaults to the previous direction's list and may be derived
  from previous scoring.
- Enabling this requires a prompt amendment — builds must be required to log the desired
  criteria accessibly. The amendment is drafted here and adopted through `C:\Project`'s own
  process before machine-scored runs.
- JEV-type judge models are realized as separate `devin -p` sessions per scoring event
  (see `implementation.md`); model pinned cheap and distinct from the builder's.

## Scoring split

- **Owner** scores chosen criteria (satisfaction, ranking) at review points.
- **Machine (JEV)** scores the direction's named criteria against the build's emitted
  evidence; the JSON verdict is appended to the development log. Verdicts carry
  `user_opinion` / `user_commentary` slots the owner fills at review — in this era
  JEV values are exploratory and owner scoring highlights notable areas; an
  untouched criterion is unreviewed, not agreed (owner note 2026-11-27).
