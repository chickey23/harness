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
required); the owner scores chosen criteria with machine assessment planned via a prompt
amendment requiring accessible logging of desired criteria; the cycle budget is per direction
with failure recorded but not auto-retried; splits are new starts and any index of project lines
is local and non-authoritative; the gate is *clarify sufficiently*, with ambiguous directions
rejected as inadequate.

Still open:

- **Prompt feedback path.** Log results inform prompt revisions at review points; revisions are
  adopted only through `C:\Project`'s own process. Who drafts the proposed amendment text —
  the harness session proposing, or the owner?
- **Accessible logging.** The prompt amendment must name which criteria builds must log
  accessibly for machine scoring. Is that list defined by the rubric (single source) or stated
  per direction?
- **User ranking scope.** Ranking over what set — approaches within one direction, cycles within
  a project, or candidates across projects?
- **Gate calibration.** Per-cycle clarification is *sufficient* while workspace doc discipline
  stays *exhaustive* — confirm the intended distinction is durable, not a softening of the
  AGENTS.md convention.
- **Local index placement.** If an index of project lines is kept, where — a doc here, or inside
  each project?
- Whether mechanical enforcement of the clarification gate (hook/skill) is a method concern or
  a harness mechanism — currently treated as harness, enforced by documentation only.
