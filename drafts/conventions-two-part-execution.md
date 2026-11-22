# Draft: two-part execution convention set

Proposed 2026-11-22 for adoption into `C:\Project\MigrateInbound\CONVENTIONS.md` as a new
**Execution structure** section. Owner satisfied with wording as of this date; classifications
proposed, pending corpus adoption. Purpose: focus rework and grading on individual parts of a
build — directions and JEV verdicts address a part, modify-and-measure holds one part frozen.

Origin: owner's Two-Plane Modular Execution & Readiness Gate proposal, decomposed into
separately-reviewable C-* entries (corpus pattern: each value separately reviewable, cf.
C-ExplicitPolicies, C-SupportedOS-*).

## Proposed entries

| ID | Convention | Proposed class |
|----|-----------|----------------|
| C-TwoPartExecution | The build divides into two parts along the Interactive Readiness Gate: Part 1 covers what the gate's conditions cover; Part 2 is everything after | behavior-shaping |
| C-ReadinessGate | User interaction unlocks at a declared gate testing two conditions: input readiness (primitive pipelines + primary interactive LLM handles accept and route input) and ledger readiness (essential launch partition mounted, valid, queryable) | behavior-shaping |
| C-LaunchPartition | The essential launch slice of the assertion ledger mounts from a dedicated launch file, materialization ordered by modular schema dependencies | realization |
| C-TransientBoundary | Transient artifacts the ledger schema declares purgeable live in a disposable boundary, independently resettable on failed launch or incomplete cleanup | realization |
| C-SnapshotInference | Foreground inference (divergent POVs, JEV verification, specialized LLMs) runs in parallel, each task reading its own consistent ledger snapshot — parallel tasks see stable state, not each other's uncommitted work; tool operation within a task is unaffected | realization |
| C-SequentialCommit | Verified inference outputs commit sequentially back to the ledger | realization |

## Dependency shape

```
C-TwoPartExecution ──seam──> C-ReadinessGate <──feeds── C-LaunchPartition
                                    │              C-TransientBoundary (Part 1 machinery)
                                    └─after: C-SnapshotInference + C-SequentialCommit
```

## Deliberately left as implementation choices

Launch-partition membership, launch-file lifecycle, snapshot granularity, gate failure mode,
subscription hydration mechanism (folded into Part 2's definition, least checkable).

## Open harness-level item

Partial cycles — whether a direction may budget iterations on one part with the other frozen —
belongs in `harness/workflow.md`, not the convention set.
