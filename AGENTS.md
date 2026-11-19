# AGENTS.md — Harness workspace

Documentation workspace for the Avatars development harness. Non-normative.

## Boundaries

- `C:\Project` (`greymonkeyai/project`) holds the spec corpus and is **read-only from here**
  unless the owner directs otherwise. Cite it by path and identifier (E-*, M-*, D-*, §sections);
  do not restate its content wholesale.
- This workspace documents *how* implementations are built and compared — not *what* an
  implementation must do.
- This workspace holds **harness-specific documents only**. Each implementation's development
  log lives in that project's own folder; `C:\Other Projects` may hold dev/test data.
- **IP separation is deliberate.** This repo lives under `chickey23`, not `greymonkeyai`; the
  accounts carry separate IP status. Do not move or mirror content into the `greymonkeyai` org
  without explicit owner direction.

## Clarification discipline

The owner runs clarification to exhaustion: enumerate every open decision; do not cap clarifying
questions at a fixed count; wait for answers before planning or writing normative text.

## Doc conventions

- `method/` holds the iterative design method — an independently refined procedure. Changes to it
  are method revisions, not harness changes.
- `harness/` holds the harness machinery itself — `workflow.md` is the operating model,
  `rubric.md` the working rubric, `implementation.md` the current Devin-CLI realization.
- `use-cases/` holds worked examples of the harness in use. Keep each focused; mark provisional
  status and date.
- Distinguish the harness (comparison machinery) from the design method (what runs on it) in every
  document.
