# Harness — development-harness documentation (Avatars project)

This workspace documents the **development harness** for the Avatars venture: the mechanisms by
which implementations of the shared Project Prompt are built, compared, and refined.

Normative project material lives in the planning workspace (`greymonkeyai/project`, local
`C:\Project`): `ProjectPrompt.md`, `ECOSYSTEM.md`, `MAXIMS.md`, `DESIGN_CHOICES.md`, and the
`InstructionsFor*.txt` metaprompts. This workspace is **non-normative** — it records mechanisms,
procedures, and usage cases; it does not define requirements.

## Three documented concerns

The harness is not the same thing as the iterative design method and prompt-driven design style
used to develop this project. This workspace documents them distinctly:

- **`method/`** — the iterative design method: a procedure unto itself, refined independently
  of this harness. It predates the harness and would survive different tooling.
- **`harness/`** — the machinery that makes builds comparable: the operating model
  (`workflow.md`), working rubric (`rubric.md`), Devin-CLI realization (`implementation.md`),
  operator procedure (`runbook.md`), copyable per-project files (`templates/`), and the
  evaluation model (`InstructionsForEvaluationModel.txt` in `C:\Project`, provisional).
- **`use-cases/`** — worked examples of the harness serving real development, including the
  method running on it. Not the method definition itself.

## Working conventions

- Implementation repos are disposable; this workspace and `C:\Project` are the durable assets.
- Every mechanism documented here should name its concrete realization (repo, skill, session
  type, output contract) and its open questions — mirroring the D-* seam between functional
  intent and replaceable realization.
- Development logs and comparison results live in each implementation's own project folder — a
  continuous per-project log, not in this workspace. Dev/test data may live under
  `C:\Other Projects`.
