# INDEX.md — Avatars spec corpus index

Draft v0, 2026-11-22. Map of defined terms, identifier families, canonical files, and
boundaries for `C:\Project`. Entries cite; files carry the text.

## Identifier registry

| Prefix | Family | Canonical file |
|--------|--------|----------------|
| E-* | Ecosystem elements — the system model | `MigrateInbound/ECOSYSTEM.md` (commentary: `ECOSYSTEM_explained.md`) |
| G-* | Local glossary terms | `MigrateInbound/GLOSSARY.md` |
| D-* | Design choices — indexed realization records | `MigrateInbound/DESIGN_CHOICES.md` |
| C-* | Conventions — intermediate-specificity commitments | `MigrateInbound/CONVENTIONS.md` (mechanics: `InstructionsForConventions.txt`) |
| M-* | MAXIMs — design principles | `Design/MAXIMS.md` (commentary: `Design/MAXIMS_explained.md`) |
| S-* | Named scenarios (e.g. S-list-project, S-personality-create) — implementation choices retained as a parallel set to inform testing | cited via `CONVENTIONS.md` C-CanonicalScenarios |

Adjacent vocabulary (cross-project, defined outside this corpus): assertion ledger terms —
claimant/author, assertion/assumption, `need:*`, computed views, surfaces, gaps — governed by
the `assertion-ledger-vocabulary` skill.

## Specificity model

Three tiers, in order of binding force:

1. **Prompt-specified behavior** — `MigrateInbound/ProjectPrompt.md`. Binding by being the
   prompt. The corpus's one project requirement: conformance with the normative prompt.
2. **Conventions** — `MigrateInbound/CONVENTIONS.md`. Default-binding, challengeable by
   recorded challenge, adjudicated at review (promote / retain / retire).
3. **Implementation choices** — free; unrecorded departure from a convention is a defect,
   departure from a choice is none.

## File map

| File | Scope | Status |
|------|-------|--------|
| `AGENTS.md` | Agent guidance: clarify to exhaustion; corpus durable; harness boundary | standing |
| `README.md` | Purpose, scope, navigation | current |
| `Design/MAXIMS.md` | M-* design principles | canonical, living |
| `Design/MAXIMS_explained.md` | M-* commentary — same identifiers and order | canonical, living |
| `MigrateInbound/ProjectPrompt.md` | The developing normative prompt | working (owner ruling 2026-11-23; MetaPrompt: `InstructionsForProjectPrompt.txt`) |
| `MigrateInbound/ECOSYSTEM.md` | E-* ecosystem elements | planning draft 2026-09-24 |
| `MigrateInbound/ECOSYSTEM_explained.md` | E-* commentary, unresolved boundaries | planning draft |
| `MigrateInbound/ECOSYSTEM_ASSESSMENT.md` | Assessment of the ecosystem model | review aid |
| `MigrateInbound/GLOSSARY.md` | G-* local terms; maintain during planning, freeze during implementation | planning draft |
| `MigrateInbound/DESIGN_CHOICES.md` | D-* realization records | planning draft 2026-09-24 |
| `MigrateInbound/CONVENTIONS.md` | C-* convention set (49) | adopted 2026-11-19; living — additions via review (latest: Execution structure, 2026-11-22) |
| `MigrateInbound/InstructionsForConventions.txt` | Convention mechanics: challenge, adjudication, addition grounds | protocol |
| `MigrateInbound/InstructionsForProjectPrompt.txt` | MetaPrompt — governs prompt development | protocol |
| `MigrateInbound/InstructionsForMAXIMS.txt` | MAXIMs derivation notes (incl. M-Convention corollary) | protocol |
| `MigrateInbound/InstructionsForUserExperience.txt` | Governs the `UserExperience` publication | protocol; publication a reserved slot |
| `MigrateInbound/InstructionsForEvaluationModel.txt` | Reserved slot for the evaluation-model publication | reserved |
| `MigrateInbound/InstructionsForReadme.txt` | Governs README derivation | protocol |
| `MigrateInbound/InstructionForAgents.txt` | Source notes for `AGENTS.md` | protocol |
| `MigrateInbound/MigrationProcedure.md` | The migration procedure | process |
| `MigrateInbound/MigrationProcedureDiscussion.txt` | Reasoning record for the procedure | record |
| `MigrateInbound/PromptReview.md` | Review guidance: classification errors to watch | review aid |
| `MigrateInbound/ProjectPrompt_review.md` | MAXIM-keyed review of the prompt | review aid |
| `MigrateInbound/MAXIMS_ASSESSMENT.md` | Conformance audit of prior work against MAXIMs | assessment |
| `MigrateInbound/MAXIMS_history.md` | MAXIMs revision history | record |
| `MigrateInbound/UserConcerns.json` | User-concern data (tagged M-*/G-*/etc.) | data |
| `MigrateInbound/Devin comparison.md` | Historical implementation comparison | record |
| `MigrateInbound/.maxims-update/` | Staging copies for MAXIMs revision work | transient |
| `Reporting/` | Migration reporting outputs | reserved |
| `MigrateInbound/` | Inbound stage — closed 2026-11-23, retained for reference; name is provenance, contents keep their individual statuses | closed |

## Boundaries

- `C:\Project` is read-only from `C:\Harness`; cite by path and identifier.
- `C:\Harness` (`chickey23/harness`) is non-normative, separate IP status; see
  `DESIGN_CHOICES.md` D-DevelopmentHarness.
- Reference repos per `README.md`: Meta Analysis (private — consult for an introduced
  purpose), Meta Sandbox (reference model), GreyAvatar (read-only reference). Avatars is the
  deprecated archive, opt-in only.
- Compartmentalization is deliberate: consult references for the purpose introduced; intended
  scope and delivered capability stay distinct.
