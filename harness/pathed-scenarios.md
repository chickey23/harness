# Pathed scenarios — synthesized interaction workflows

Provisional, 2026-11-27. Non-normative machinery: the procedure for deriving and
gap-checking **pathed scenarios** — ordered interaction workflows composed from the
scenario suite. Referenced by [`workflow.md`](workflow.md) §Project intake and
§Scenario checks. Owner direction 2026-11-27.

## What a pathed scenario is

A pathed scenario (`P-*` id) is an ordered sequence of **steps** that walks a user
through the product as a single workflow — launch, find something, act on it, see the
result. Each step composes one or more `S-*` scenarios and names the **interface
item** the user touches at that step.

Interface items are named normatively as `module.affordance`, where `module` is a
module name from the project's current implementation design (e.g. `impl-design-001`:
`ledger`, `needs`, `personas`, `conversation`, `tools`, `sources`, `fleet`,
`exchange`, `stage`, `shell`) and `affordance` names a user-reachable item that
module's **surface obligations** declare — or a gap where no module declares it
(see §Gap check). Naming by modular design directive is deliberate: the path and the
design share a vocabulary, so analysis can bind them mechanically.

## Build procedure

1. Collect the scenario suite (`scenarios.md`) and the current module table with its
   surface obligations.
2. Identify user journeys that chain scenarios — real sequences an owner walks, not
   module tours: e.g. *launch → observe readiness → address a persona by name → hear a
   reply → see the need close* composes `S-windows-launch`, `S-chat-invocation`,
   `S-respondent-union`, `S-speech-serialization`, `S-need-fulfillment`.
3. Write each path as an ordered step list in the suite's `## Paths` section. Each
   step carries: `step — interface item (module.affordance) — enacts S-id(s) — user
   action in words`.
4. Give paths `P-*` ids and a one-line journey description. Paths may overlap —
   sharing steps is expected; consolidation is the workflow's job, not uniqueness.
5. A path is **enactable** when every step's interface item is reachable in sequence —
   each step's entry state is the prior step's exit state. JEV scoring treats a path
   like a scenario: 0–1 on ability to enact, with the additional bar that legs chain
   end-to-end.

## Analysis — interface enumeration

Walking a path enumerates the interface items the user can reach. The union of all
paths' step items is the product's **declared reachable surface** — the set of
affordances the user path can exercise. This is what converts "the feature exists"
into "the user can use it": an interface item named by no path is unreachable by any
known journey, and a scenario woven into no path is one the user never encounters.

## Gap check

Run at review (and available to the emitter as a computed sign):

- **Unconsolidated scenarios** — `S-*` ids referenced by no path. **Tolerated** —
   paths are synthesized incrementally and a scenario may await its journey — but
   recorded as gap signs: each unconsolidated scenario is either a dead surface or an
   unwritten path, and the review should say which.
- **Undeclared interface items** — `module.affordance` names paths reference that no
   module's surface obligations declare. Either the path names the wrong item or the
   module's obligations are incomplete; both are findings.
- **Unreachable obligations** — module surface obligations touched by no path. The
   affordance is declared but user-invisible: the hidden-feature shape R-U1 bars
   ("a feature not usable by the user doesn't count"). Notable, not tolerated.
- **Discontinuous paths** — paths whose legs cannot chain (a step's required entry
   state is unreachable from the prior step). The path is aspirational, not a
   workflow; flag rather than delete.

Report shape: consolidated coverage (`n/m` scenarios woven into ≥1 path), the
unconsolidated list, undeclared items, unreachable obligations, discontinuous paths.

## Format (project-side)

In `scenarios.md`, below the faceted suite:

```markdown
## Paths

| Path | Journey | Steps | Enacts |
|------|---------|-------|--------|
| P-first-run | Install → first conversation | shell.launch → fleet.roster → personas.selector → conversation.chat → needs.floor | S-windows-launch, S-fleet-roster, S-personality-roster, S-chat-invocation, S-need-fulfillment |
```

Step arrows enumerate interface items in order; the **Enacts** column names the
scenario ids the path consolidates. Gap signs are derived, not written — the check
procedure recomputes them each review rather than maintaining a list by hand.
