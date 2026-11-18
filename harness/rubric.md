# Local rubric — default scoring criteria

Provisional, 2026-11-16. Non-normative: the working rubric referenced by
[`workflow.md`](workflow.md). It evolves at review points; every development-log entry cites the
revision that judged it.

## Default criteria

- **User satisfaction** — the build satisfies the user's stated directions and the prompt's
  required behavior.
- **User ranking (required)** — the user ranks results across a project — the accumulated
  candidates of a line of development — rather than only scoring each in isolation.

## Machine-assessable criteria

- Each direction may name **desired criteria** that builds must log accessibly, so they can be
  scored by machine later. The list defaults to the previous direction's list and may be derived
  from previous scoring.
- Enabling this requires a prompt amendment — builds must be required to log the desired
  criteria accessibly. The amendment is drafted here and adopted through `C:\Project`'s own
  process before machine-scored runs.
- JEV-type judge models are anticipated for machine-assessable criteria; model and interface
  are not yet chosen.

## Scoring split

- **Owner** scores chosen criteria (satisfaction, ranking) at review points.
- **Machine** scoring of objective criteria is planned for; until then it does not exist and no
  cycle should pretend to it.
