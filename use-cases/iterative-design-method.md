# Usage case — the iterative design method on the harness

Provisional, 2026-11-16. Non-normative: a worked example of the harness serving real
development.

The iterative design method is defined and refined independently in
[`../method/iterative-design-method.md`](../method/iterative-design-method.md). This document
is not the method — it records how the method runs *on* this harness, whose operating model is
[`../harness/workflow.md`](../harness/workflow.md), and where the two might drift into each
other.

## How the harness serves the method

| Harness mechanism | Role in the method's stages |
|---|---|
| Spec repo + build repo topology | Stage 1/4: spec stays versioned and read-only during a build cycle; the build repo is disposable |
| Wave prompts citing spec by identifier | Stage 3: a session prompt stays small because it addresses the spec, not restates it |
| Clarification gate (rules + skills) | Stage 2: enforces exhaustion where agent defaults cap questions |
| Scoring-run / guided-evolution modes | Stage 3/4: a direction names the region to improve plus a cycle budget; with no direction the cycle just scores against the rubric |
| Per-project development log | Stage 4: findings and results append to the project's own continuous log (prompt ref + rubric revision + results + user directions), closing the loop without touching this workspace |
| Parallel implementations + evaluation model | Stage 4: eval becomes comparison — realizations of the same spec scored on the same demonstrations |

## Open questions

Resolved by owner direction (2026-11-16): baseline is chosen per direction (fresh or
modify-and-measure); the default rubric is local and minimal (user satisfaction, user ranking
required across the project — see `../harness/rubric.md`); the owner scores chosen criteria with
machine assessment planned via a prompt amendment requiring accessible logging of criteria named
per direction (imported from the previous direction by default, derivable from previous
scoring); the cycle budget is per direction with failure recorded but not auto-retried; splits
are new starts and any index lives inside the project, non-authoritative; the gate is *clarify
sufficiently* with ambiguous directions rejected as inadequate — the stricter exhaustion rule is
the developer's discipline for spec/doc work, deliberately not imposed on cycles; the session
proposes prompt amendments and the user edits and approves. Mechanical enforcement is a harness
concern, realized as hooks in the project's `.devin/` config; the JEV is a separate `devin -p`
session pinned to a cheap model emitting JSON verdicts — see `../harness/implementation.md`.

Still open:

- The check logic inside the gate hooks (what counts as "ambiguous" / a complete log entry) —
  evolves per project with use.
- Whether low judge confidence triggers automatic frontier-model escalation or just flags for
  the owner.
- Cloud sessions for unattended multi-cycle runs — deferred until local runs are stable.
