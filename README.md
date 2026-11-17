# Harness — development-harness documentation (Avatars project)

This workspace documents the **development harness** for the Avatars venture: the mechanisms by
which implementations of the shared Project Prompt are built, compared, and refined.

Normative project material lives in the planning workspace (`greymonkeyai/project`, local
`C:\Project`): `ProjectPrompt.md`, `ECOSYSTEM.md`, `MAXIMS.md`, `DESIGN_CHOICES.md`, and the
`InstructionsFor*.txt` metaprompts. This workspace is **non-normative** — it records mechanisms,
procedures, and usage cases; it does not define requirements.

## Two documented concerns

The harness is not the same thing as the iterative design method and prompt-driven design style
used to develop this project. This workspace documents both, distinctly:

- **Harness mechanisms** — the machinery that makes builds comparable: spec-addressed wave
  prompts, parallel implementation repositories, clarification gates, session orchestration, and
  the evaluation model (`InstructionsForEvaluationModel.txt` in `C:\Project`, provisional).
- **Usage cases** (`use-cases/`) — the iterative design method and prompt-driven design style
  documented as exercised *through* the harness. Each usage case is a worked example of the
  harness serving real development, not a description of the harness itself.

## Working conventions

- Implementation repos are disposable; this workspace and `C:\Project` are the durable assets.
- Every mechanism documented here should name its concrete realization (repo, skill, session
  type, output contract) and its open questions — mirroring the D-* seam between functional
  intent and replaceable realization.
- Comparison results belong in per-implementation assessment records, not in this workspace's
  durable docs, unless promoted by review.
