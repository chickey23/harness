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

- **Baseline inheritance.** May a guided-evolution cycle start from a chosen prior
  implementation (modify-and-measure), or must every cycle build fresh from the prompt? Fresh
  builds keep the prompt as the only variable; modify-and-measure is cheaper for metric
  questions like the cloud-storage example.
- **Rubric home.** Does the working rubric live in this workspace (non-normative, evolving)
  until `EvaluationModel` exists, or in the spec corpus from the start?
- **Scoring authority.** Does the building session score its own work, does a separate
  evaluator session score it, or does the owner? Compartmentalization argues against
  self-scoring.
- **Split lineage.** When a project splits, does the child log cite its parent and fork point?
  Is there a central registry of project lines in this workspace, or no index at all?
- **Review cadence.** Is the cycle budget always set per direction, or is there a standing
  default (and early-interrupt conditions, e.g. rubric failure)?
- Whether mechanical enforcement of the clarification gate (hook/skill) is a method concern or
  a harness mechanism — currently treated as harness, enforced by documentation only.
