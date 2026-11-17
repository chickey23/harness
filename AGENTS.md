# AGENTS.md — Harness workspace

Documentation workspace for the Avatars development harness. Non-normative.

## Boundaries

- `C:\Project` (`greymonkeyai/project`) holds the spec corpus and is **read-only from here**
  unless the owner directs otherwise. Cite it by path and identifier (E-*, M-*, D-*, §sections);
  do not restate its content wholesale.
- This workspace documents *how* implementations are built and compared — not *what* an
  implementation must do.
- **IP separation is deliberate.** This repo lives under `chickey23`, not `greymonkeyai`; the
  accounts carry separate IP status. Do not move or mirror content into the `greymonkeyai` org
  without explicit owner direction.

## Clarification discipline

The owner runs clarification to exhaustion: enumerate every open decision; do not cap clarifying
questions at a fixed count; wait for answers before planning or writing normative text.

## Doc conventions

- `use-cases/` holds usage cases of the harness — worked examples of the iterative design method
  and prompt-driven design style. Keep each focused; mark provisional status and date.
- Distinguish the harness (comparison machinery) from the design method (what runs on it) in every
  document.
