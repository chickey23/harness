# The iterative design method

Provisional, 2026-11-16. Non-normative: describes a development procedure, not product
requirements.

The iterative design method is a **procedure unto itself**, refined independently of any
particular harness, platform, or codebase. It predates the harness documented in this workspace —
it is the method behind the single-prompt rebuild pattern and the taught class — and it would
survive unchanged on different tooling. This folder is its home; `use-cases/` records instances
of it running on the harness.

## The procedure

```
                        spec corpus (durable, versioned)
                        ┌─────────────────────────────────┐
                        │  requirements · design criteria │
                        │  values · open decisions        │
                        └──────────────┬──────────────────┘
                                       │
  1. REQUIREMENTS INTAKE               ▼
     purpose/scope/constraints ──► spec document (not chat)
                                       │
  2. CLARIFICATION GATE  ══╦══►  enumerate EVERY open decision;
     no cap on clarifying    ║    wait for answers
     questions               ║    ↳ produces clarification log
                                       │
  3. GATED BUILD                       ▼
     spec passes validation ──► build driven by spec-addressed
     (test, SME sign-off,         prompts; sessions are disposable
      values/design criteria)
                                       │
  4. EVALUATION & RESTART              ▼
     build scored vs spec ──► findings written back INTO
                                  the spec corpus ──────┐
                                                        │
     ┌──────────────────────────────────────────────────┘
     ▼
  loop: the corpus compounds; prompts and sessions do not
```

## What is being refined

The object under refinement is the **spec document set**, not the prompt and not the session.
External validation gates (test, SME sign-off, values/design-criteria check) establish fitness
before build; the build is evidence for the next revision of the spec. Judgment is externalized
into written criteria so the procedure transfers across people, platforms, and sessions.

## Relationship to the harness

The harness (see `../README.md`) supplies machinery the method can run on: spec/build repo
topology, wave prompts, parallel implementations, evaluation. The method requires none of it —
a single disciplined document loop is a complete instance. The harness becomes necessary when
the method must scale to parallel builds, coordinated bundles, or cross-implementation
comparison.

## Refinement notes

- Method-vs-harness confusion is the main drift risk: a mechanism adopted for convenience (a
  session type, a platform feature) must not silently become a step of the method.
- The procedure is currently enforced by documentation (AGENTS.md rules, this file). Whether a
  mechanical gate belongs in the method or stays a harness concern is an open question — see
  `../use-cases/iterative-design-method.md`.
