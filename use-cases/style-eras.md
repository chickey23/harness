# Usage case — style eras and the theme layer

Provisional, 2026-11-23. Non-normative: a worked example of using directions to raise
generated-UI presentation above the default, and of keeping the judgment mechanical enough
for the JEV.

## Motivation

One-shot builds against the prompt default to undifferentiated minimal presentation —
owner-described "1980s BBS quality." That is not bad styling; it is the absence of a style
system. Judging the artifact cannot fix it; the fix is to require the layer.

The product goal is not a static good-looking UI but a maximally customizable user
experience. Sequencing: **theme layer first** — font styling, color palettes,
alignment/centering, margins, borders — then the **layout layer** (movable panels) later.
Same mechanism, two kinds of editable config.

The owner's working vocabulary is era-reference ("this looks like an old mac," "managers
like the default MS style"). A year or era name is shorthand for a coherent bundle of
defaults — a settings preload. The direction can therefore speak the owner's vocabulary
directly.

## The mechanism

A direction names two requirements:

1. **Theme layer** — all presentation decisions (typography, color, alignment, spacing,
   margins, borders) resolve through a declared, editable *common choice set* recorded
   in the ledger — itself extensible: a new slot kind is a new assertion family governed
   by the template machinery, not a schema change. No literals inside components.
2. **Era preloads** — a named suite of bundles over that same choice set, recorded as
   assertions, which the build must ship and switch between *without changing code* —
   e.g. `terminal-1985`, `mac-1995`, `corporate-2005`, `flat-2024`. A preload is a
   starting point, not a mode: user edits supersede individual values under normal
   ledger rules, and a user's current style can itself be named as a new preload.
   Preload names come from the direction; markers for each are stated in the direction
   (see below).

This works direction-scoped immediately — no corpus change needed to run it once.
The proposal (`../harness/style-layer-draft.md`) drafts the machinery as conventions
(C-* tier: challengeable defaults), so builds follow it unless they record a challenge —
ledger residency makes a preload a starting point rather than a locked mode.

## What the JEV scores

All three checks are conformance, not taste — which is what keeps the cheap-model pin.

| Check | What it measures | Evidence class |
|---|---|---|
| **Token coverage** | Fraction of presentation declarations resolved through the common choice set vs literals in components | repository — grep-class, cite counts + `path:line` |
| **Preload validity** | Each preload against the bounded markers the direction lists (e.g. `terminal-1985`: monospace family, zero radius, ≤2 colors, dense spacing) — all expressible as values over the shared slots | repository + emitted artifacts |
| **Switchability** | Build renders under ≥2 preloads with no code change | enactment — the build emits a rendered artifact or DOM dump per preload |
| **Supersession** | A user edit to one slot overrides the active preload's value for that slot only — the preload is a starting point, not a lock | enactment — emitted record showing preload applied, one slot edited, other slots retained |

The supersession and switching checks double as candidate **named scenarios** for the
project's scenario suite — they are enactable user-facing behaviors, not just properties
of emitted evidence:

- `preload-switch` — apply a second preload at runtime; presentation re-renders, no code
  change, no restart.
- `preload-supersede` — apply a preload, edit one slot; the edit wins, other slots
  retain the preload's values.
- `preload-name` — a user's current style is named and becomes available as a preload
  like any shipped one.
- `preload-share` — a preload bundle transfers to another installation and applies
  there. (Requires an exchange path; may be deferred with the layout layer.)
- `preload-extend` — a preload or edit names a slot the build doesn't define; the
  system records an unmet need for the unknown choice rather than silently dropping or
  erroring — the extensible ledger's graceful-extension path.

Scenarios name the behaviors users enact; the JEV criterion scores the record the
enactment emits — same behavior, two roles in the machinery. Canonical adoption into a
project's suite is an intake/review decision, per the suite-sync process in
`../harness/workflow.md`.

Markers live **in the direction**, not in the judge. That keeps the JEV mechanical:
it verifies declared markers rather than inferring an era.

## What stays tracked, not scored

Style readouts — the era estimate ("indicative of what year"), choice density,
distinct-value histograms — are emitted by builds as named criteria and tracked like
`time to implement`. Promotion to a scored criterion happens only after owner rankings
at review show which readouts actually predict satisfaction. The era scalar survives as
a devlog label and diagnostic, not a verdict.

## Sample direction

```yaml
region: presentation layer
baseline: fresh
cycle budget: 3
style requirement:
  theme layer: all font/color/alignment/margin/border decisions via a declared common
               choice set; preloads and edits recorded as assertions
  preloads: terminal-1985 | mac-1995 | corporate-2005 | flat-2024
  preload markers:
    terminal-1985: monospace; radius 0; ≤2 colors; line-dense
    mac-1995:      system grays; beveled edges; small type
    corporate-2005: MS default palette; restrained chrome; left-aligned
    flat-2024:     scale-based spacing; 1 accent; ≤2 shadow levels
criteria to log: token coverage; per-preload marker pass/fail; switch artifacts;
                 supersession record
tracked (not scored): choice density; distinct spacing/color values; era readout
review at: after 3 cycles
```

## Proposed rubric text (pending adoption at review)

Candidate bullet for `../harness/rubric.md` §Machine-assessable criteria:

> - **Style-layer conformance** — a direction may require a declared common choice set
>   and a named preload suite recorded as assertions; the JEV scores token coverage,
>   per-preload marker pass/fail, switch artifacts, and slot-level supersession. Style
>   readouts (era estimate, choice density, distinct-value histograms) are tracked, not
>   scored, until owner ranking shows which predict satisfaction.

## Open questions

- ~~Preload naming vocabulary~~ — resolved (owner 2026-11-23): no fixed vocabulary;
  naming serves only to suggest form in suggestions. Era labels remain the working
  vocabulary; nothing stops a direction mixing vocabularies.
- ~~Preload exchange~~ — resolved by owner direction (2026-11-23): sharing is the
  general principle, not a preload feature — users should be able to share *anything at
  any granularity*, and preloads are one instance. All config is assertions or bundles
  of assertions; granularity is whatever the bundle defines.
- ~~Minimum suite size~~ — resolved (owner 2026-11-23): ≥3 — two preloads can be faked
  with a toggle; three non-collinear points demonstrate the mechanism spans a space.
- ~~Layout-layer companion timing~~ — spec-side, not a harness decision (owner
  2026-11-23): movable panels and personality scene-presence are related parts of the
  implementation specification; see the deferred-companion note in
  `../harness/style-layer-draft.md`.
- ~~Vision-capable judge~~ — resolved (owner 2026-11-23): "appearance" rolls into the
  owner-provided score for now; no vision judging. Markers stay token-level.
