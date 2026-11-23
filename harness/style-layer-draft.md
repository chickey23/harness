# Proposed `C:\Project` updates — presentation/theme — draft for owner review

Provisional, 2026-11-23. Non-normative. Drafted in this workspace per the develop-here,
apply-there convention: the owner edits, approves, and adopts through the spec corpus's
own revision process. **Residency sentence applied to `ProjectPrompt.md` and all eight
convention candidates adopted into `CONVENTIONS.md` on owner direction, 2026-11-23.**

Corpus style rule (owner, 2026-11-23): text bound for `C:\Project` defines positively —
"not" and its kin pollute the vectors. Contrast is expressed through what a thing *is*;
negated definitions are reserved for cases where the absence itself is the content.

## Motive

Extend user customization — already covering personalities, capabilities, and
configuration — to user preferences for configurable interface and display choices.

## Layer decision (owner ruling, 2026-11-23)

The original proposal was too broad and too specific for the prompt: it restated ledger
mechanics the corpus establishes once, and embedded mechanism detail (preloads, slots,
starting-point semantics) inside a behavioral claim. Resolution: **most or all of this
is conventions — possibly one entry, possibly several.**

Resolution: **conventions, plus one residency sentence — APPROVED and applied
2026-11-23** to `ProjectPrompt.md` §Communication and surfaces. Unconditional
capability claims are unkeepable promises (display-bounded surfaces exist) and
conditional prompt text is unwanted; the convention tier carries the conditional
mechanism — challengeable by record, obviated by platform context (owner ruling 5).

> User preferences for configurable interface and display choices are recorded in the
> assertion ledger.

The sentence claims residency rather than capability — keepable by every build, since
every implementation has the ledger; customization follows as a consequence
(attribution, supersession, exchange, user-set) rather than being promised. Its
breadth covers interface arrangement as well as appearance, so the deferred layout
companion is already residency-covered; what remains for it is convention work.

## Candidate conventions — `MigrateInbound/CONVENTIONS.md`

| ID | Convention |
|----|-----------|
| `C-DeclaredPresentation` | Presentation decisions (typography, palette, alignment, spacing/margins, borders) resolve through a declared common choice set recorded as ledger assertions; interface code consults the choice set at render; embedding presentation literals in components requires a recorded challenge |
| `C-SettingsPreloads` | Named settings preloads are assertion bundles over the common choice set; a preload supplies starting values that later user choices supersede; shipped, custom, and exchanged bundles are one kind of object |
| `C-PreloadSuite` | Builds ship ≥3 named preloads and enact switching plus per-slot supersession; era-named bundles are the working vocabulary; test convention per owner ruling 4 |

Notes for adoption:

- The extensibility clause drops out — an assertion-resident choice set is extensible
  by the ledger's own rules; a convention needn't re-state them.
- `C-PreloadSuite` is deliberately a test convention (ruling 4: criteria and named
  scenarios may be conventions) — the enactable checks live in `use-cases/style-eras.md`.
- The ≥3 floor: two preloads can be faked with a toggle; three non-collinear bundles
  demonstrate the mechanism spans a space.

## Deferred companions

Related parts of the implementation specification, for a later wave (owner direction
2026-11-23). If the theme layer lands at convention level, the layout layer likely
lands there too — same mechanism, one level up.

1. **Layout layer:** arrangement (panel positions, movable regions, workspace layout)
   as a declared, editable structure that interface code consults.
2. **Personality presence (conventions):** the owner's model — personalities
   assignable to specific surfaces; per-device selectable roster supporting reordering
   via dyadic relationship assertions by default (relative ordering as pairwise
   records, not a stored list); a stage showing current-discussion participants
   (can put on shows); quick-select near chat; stage movement for fun; traversal via
   scripted paths where the display allows; chorus members of any rank appear when
   addressed directly; device-specific, bounded by display capability.

Candidate entries: `C-SurfaceAssignment`, `C-PresenceRoster` (dyadic reordering),
`C-PresenceStage`, `C-QuickSelect`, `C-ChorusOnAddress` (any rank) — classified and
worded at adoption.

These are pinned here for adoption; the harness asserts criteria, and these await their
corpus home.
