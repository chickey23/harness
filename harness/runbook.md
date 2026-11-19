# Runbook — operating a project on the harness

Provisional, 2026-11-18. Non-normative how-to. The model lives in
[`workflow.md`](workflow.md), the criteria in [`rubric.md`](rubric.md), the realization in
[`implementation.md`](implementation.md). This document is the operating procedure — what a
person or agent session does, in order.

## Roles

- **Owner** — issues directions, scores and ranks at review, approves prompt amendments, calls
  points of no return.
- **Coordinator session** — the owner's interactive Devin session; runs anywhere with access to
  the project folder and this workspace. Applies the gate, drives the cycle budget, drafts
  amendments.
- **Build session** — a disposable Devin session running in the project folder.
- **JEV session** — a separate `devin -p` invocation per scoring event (see
  `implementation.md`).

## 1. Birth a project

The owner names a project folder and points the coordinator at it. Scaffold:

```
<project>/
  .devin/
    hooks.v1.json        # ← harness/templates/hooks.v1.json
    direction-gate.ps1   # ← harness/templates/direction-gate.ps1
    check-devlog.ps1     # ← harness/templates/check-devlog.ps1
    jev-prompt.md        # ← harness/templates/jev-prompt.md
  prompt.md              # snapshot or citation of the prompt revision in force
  devlog.md              # ← harness/templates/devlog.md
  <implementation…>      # created by the first cycle, or copied baseline
```

The prompt snapshot in `prompt.md` is the revision every cycle in this project answers to,
until a review adopts a new one.

## 2. Issue a direction

Use [`templates/direction.md`](templates/direction.md). Minimum fields: region or variable,
baseline (fresh / modify-and-measure from a named build), cycle budget. Optional: approach
count, criteria to log (default: inherit the previous direction's).

The coordinator clarifies the direction sufficiently. Ambiguous → rejected as inadequate; it
does not run.

## 3. Run a cycle

1. Build session in the project folder realizes the entire application per the direction.
2. The build emits accessible evidence for the named criteria — required by the prompt's
   evaluability paragraph.
3. Score: invoke the JEV in the project folder, e.g.
   `devin -p --model <cheap-model> -- (Get-Content .devin/jev-prompt.md -Raw)`
   with the criteria filled in. Judge model ≠ builder model.
4. Append the JSON verdict to `devlog.md` under a new cycle entry (see
   `templates/devlog.md`).
5. Repeat to the direction's budget. Failed cycles are logged, not auto-retried.

For multi-approach directions, run one build session per approach; each gets its own cycle
entry and verdict.

## 4. Review point

When the budget is spent: the owner reads `devlog.md`, scores chosen criteria, and **ranks the
project's accumulated candidates**. The coordinator drafts prompt-amendment proposals; the
owner edits and approves them for adoption through `C:\Project`'s revision process. The owner
decides: continue under a new direction, split, or close.

## 5. Point of no return

Owner-directed only. A split is a new start: new project folder (repeat step 1), new
`devlog.md`. A project may keep its own index of lines/variants internally, for reference.
