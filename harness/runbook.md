# Runbook — operating a project on the harness

Provisional, 2026-11-18. Non-normative how-to. The model lives in
[`workflow.md`](workflow.md), the criteria in [`rubric.md`](rubric.md), the realization in
[`implementation.md`](implementation.md). This document is the operating procedure — what a
person or agent session does, in order.

## Roles

- **Owner** — issues directions, scores and ranks at review, approves prompt amendments, calls
  points of no return.
- **Coordinator session** — the owner's interactive Devin session; runs wherever the owner
  opens it (the **coordinator home**). Applies the gate, drives the cycle budget, drafts
  amendments. The coordinator home is *usually but not necessarily* the project folder.
- **Build session** — a disposable Devin session running in the project folder.
- **JEV session** — a separate `devin -p` invocation per scoring event (see
  `implementation.md`).

## 0. Cold start and intake

A session in any folder may be told "look in `C:\Harness` and set up to run it in this folder"
(or another folder). That folder is the coordinator home; the **project folder is wherever the
owner says it is** — usually the same folder, but not necessarily.

1. Read `C:\Harness\AGENTS.md` (boundaries) and this runbook.
2. Work through [`templates/intake.md`](templates/intake.md): **prompt the owner for every
   detail not already stated** — project folder, line name, prompt reference, baseline, first
   direction, judge model. Do not guess.

## 1. Birth a project

The owner names the project folder; the coordinator scaffolds it:

```
<project>/
  .devin/
    hooks.v1.json        # ← templates/hooks.v1.json (both gates)
    direction-gate.ps1   # ← templates/direction-gate.ps1
    check-devlog.ps1     # ← templates/check-devlog.ps1
    jev-prompt.md        # ← templates/jev-prompt.md
  prompt.md              # snapshot or citation of the prompt revision in force
  devlog.md              # ← templates/devlog.md
  <implementation…>      # created by the first cycle, or copied baseline
```

If the **coordinator home differs** from the project folder, the home may optionally get its
own `.devin/` with only the direction gate (`hooks.v1.json` carrying just the
`UserPromptSubmit` entry + `direction-gate.ps1`) — it receives directions but runs no builds,
so it needs neither the completion gate nor the judge prompt.

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
