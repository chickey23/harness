# Two-part execution convention set — adopted

Drafted and ratified 2026-11-22; adopted same day into
`C:\Project\MigrateInbound\CONVENTIONS.md` as the **Execution structure**
section; set count 43 → 49 (commit `cecb3b2`). This file is the retained
rationale record.

Context: the project is `C:\Project` (spec corpus → prompt), builds land in `C:\builds`,
the harness operates from `C:\Harness`. These conventions inform subsequent builds;
builds are organized in two-part order. Finer partitioning is deliberately deferred —
the owner will refine once satisfied with the state of the builds produced. No
partial-cycle machinery yet.

## Execution structure

| ID | Convention | Class |
|----|-----------|-------|
| C-TwoPartExecution | The build divides into two parts along the Interactive Readiness Gate: Part 1 covers what the gate's conditions cover; Part 2 is everything after | behavior-shaping |
| C-ReadinessGate | User interaction unlocks at a declared gate testing two conditions: input readiness (primitive pipelines + primary interactive LLM handles accept and route input) and ledger readiness (essential launch partition mounted, valid, queryable). The gate records its pass time in accessible evidence — time-to-gate is a named metric | behavior-shaping |
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

Launch-partition membership, launch-file lifecycle, snapshot granularity, gate failure
mode, subscription hydration mechanism.

## Notes for adoption

- The Class column records the ratified classification — it fixes which criterion silent
  non-conformance costs (parity for realization, completeness for behavior-shaping).
  Corpus table style carries ID + Convention only; keep the class in this draft or add a
  third column at owner's preference.
- Time-to-gate enters directions' named criteria lists as `time-to-gate`; the accessible
  timestamp is what makes it machine-scorable.
