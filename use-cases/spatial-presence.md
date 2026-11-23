# Captured idea — spatial presence ladder

Provisional, 2026-11-23. Non-normative: free-form capture of an idea raised in session —
not a design, not a direction. Recorded because it organizes several hung use cases
(fleet install, tour guide) around a single missing primitive.

## The idea

Personalities should be aware of — and eventually embodied within — the spaces they
present through and the spaces they serve. The nested requirement decomposes into a
ladder where each rung is the same architectural move: a declared, ledger-resident
structure that personalities read and write like any other assertion family.

1. **GUI awareness** — the surface layout is declared and addressable. Personalities
   already interpret the ledger; awareness of "what's on screen" is free once the
   layout is assertions.
2. **Embodiment** — personalities hold position/orientation slots in a scene model.
   Pointing = a gesture assertion whose referent is an addressable element. Facing each
   other = relative positions in the same scene. Characters leave the portrait box
   because the box was never a boundary — only an unaddressed space.
3. **Room and device awareness** — a second coordinate frame: surfaces and devices
   placed in physical space, related to the scene. "The kitchen surface" becomes a
   referable assertion. This is the fleet-install rung.
4. **Real world vs app** — two assertion families plus relations between them
   ("surface S is in room R"). The distinction is assertion typing; source and kind
   are native fields.
5. **Temporal space** — "here now" vs "here a hundred years ago": time-qualified
   spatial assertions. Supersession already gives time-slicing — a place's state is
   the latest assertions as of a time. This is the tour-guide rung.

## Surfaces move

Some surfaces are mobile and oriented — a carried tablet, a rotating stand, a robot.
Consequences:

- **Position is a time-series**, not a slot. A surface's placement is a family of
  assertions with validity intervals, superseded as it moves. The same temporal
  machinery that gives "a place a hundred years ago" gives "the surface was in the
  den this morning."
- **Moving surfaces can survey.** A device that knows its position and orientation
  over time can *produce* map assertions — it walks the space and records what it
  learns. Devices are not only map consumers; some are map producers.
- **Orientation is presentation-relevant.** A surface that can turn can face a user,
  face another surface, or let a personality orient its embodiment toward whoever is
  speaking. Rung 2 and rung 3 share the position/orientation vocabulary.

## Maps as sources, not structures

The space model is earned, not just declared. Maps arrive through the configured-source
machinery (E-ConfiguredSources) like any other interpreted evidence:

- **External maps** — Google Maps and similar supply base maps; source evidence,
  interpreted into spatial assertions with the provider's confidence ceiling.
- **Device-surveyed maps** — mobile/oriented surfaces produce their own spatial
  assertions; a different source kind, a different confidence profile.
- **User-declared maps** — the owner asserts a floor plan, names rooms, places
  surfaces; highest-confidence source for private space.
- These coexist in the ledger and corroborate or conflict like any other evidence —
  a device survey that contradicts the declared floor plan is an ordinary
  conflict/corroboration problem, not a special case.

Mapping functions themselves are ordinary tools, and the prompt's own machinery — the
development and deployment of *competing tools compared locally* — applies to them
directly. Survey, import, and positioning functions are invokable components with
provenance: the ledger records which tool produced which spatial assertions, so a
better implementation replaces the function, not the data. Owner expectation
(2026-11-23): open-source contributors will replace the early mapping functions —
the design should expose them as a seam, not solve them.

## Pointing: relational before metrical

"Reliable pointing at a physical object" is two problems wearing one name:

- **Relational space is cheap.** "The TV is to my left" is a declared or sourced
  relation — perfectly good ledger content, attributed and confidence-scoped, that a
  personality can already reason and speak over. Most of the value lives here:
  narration, orientation, room awareness, facing, tour guidance.
- **Metrical space is hard.** Physically accurate pointing needs calibration between
  the scene model and real coordinates — sensors, correspondence, drift. Defer it;
  it is exactly the kind of function the pluggable-mapping seam above is for.

The space model should therefore express *relations* natively (left-of, near, in-room,
facing) and treat metric coordinates as one source kind among several — required only
where a use case demands precision, never as the price of entry.

### The radio field as a source

A fleet install is already a sensor field: multiple local WiFi emitters and a
collection of hardware means positioning can arrive for free at relational resolution —
presence and proximity assertions ("device X is near emitter Y," "the tablet is in the
den") from RSSI fingerprinting or simpler association records. Richer metrical methods
(RTT/FTM, UWB, vision) slot in later as competing tools with their own confidence
profiles — the ledger doesn't care which function produced the assertion.

## The shared primitive

All rungs need one thing: **addressable, declared structures held as assertions** —
scene elements, surface placements, room topology, geographic features. The theme
layer is rung zero of the same pattern (declared editable config as assertions), which
is why it came first in the direction trajectory. The presentation-space rungs are a
closed world — fully declarable, cheap to check. The physical-space rungs add the real
problem: knowledge acquisition through sources, calibration between the surface's model
and physical reality, and confidence over spatial claims.

## Spec hooks (cite, don't restate)

E-Presentation (surfaces/modalities), E-SituationalAwareness (circumstances of
interaction), E-LocalFleet (cooperating devices), E-ConfiguredSources (maps as
evidence), E-Continuity and the ledger's supersession rules (temporal slicing),
E-Exchange (maps and placements moving between installations), E-Adaptation
(user-revisable space config). The satellite separation already recorded in
DESIGN_CHOICES — ledger authority distinct from satellite input/presentation — is the
seam this ladder climbs.

## Open threads

- ~~Where embodiment lives~~ — owner direction (2026-11-23): presence is
  device-specific and surface-assigned — roster, stage, quick-select, chorus members
  appearing when addressed, scripted movement where the display allows. These are
  **design choices** and belong in `CONVENTIONS.md` (C-* tier), not the prompt —
  pinned in `../harness/style-layer-draft.md` deferred-companions. For the suite they
  yield scenario candidates only: surface assignment, roster ordering, stage presence,
  chorus-appearance-on-address.
- Calibration: deferred by the relational/metrical split — most use cases need
  relations, not coordinates; precise pointing is a pluggable mapping function, not a
  ladder rung.
- ~~Confidence floor for spatial claims~~ — resolved as a suite scenario, not a
  threshold (owner-confirmed 2026-11-23): `narrate-place-1900` — does emitted
  narration cite sourced assertions rather than confabulate? Enforces the existing
  certainty machinery; first spatial-ladder test.
- ~~Map as first-class vs bundle~~ — resolved with correction (owner 2026-11-23): a
  map is a named assertion bundle, but *interior* maps are emergent from their
  environment — digital and physical — and are not shareable unless explicitly made
  to an exchange standard. Granularity-general sharing does not make local maps
  portable by default.
