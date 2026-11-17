# Usage case — the iterative design method on the harness

Provisional, 2026-11-16. Non-normative: a worked example of the harness serving real
development.

The iterative design method is defined and refined independently in
[`../method/iterative-design-method.md`](../method/iterative-design-method.md). This document
is not the method — it records how the method runs *on* this harness, and where the two might
drift into each other.

## How the harness serves the method

| Harness mechanism | Role in the method's stages |
|---|---|
| Spec repo + build repo topology | Stage 1/4: spec stays versioned and read-only during a build wave; the build repo is disposable |
| Wave prompts citing spec by identifier | Stage 3: a session prompt stays small because it addresses the spec, not restates it |
| Clarification gate (rules + skills) | Stage 2: enforces exhaustion where agent defaults cap questions |
| Parallel implementations + evaluation model | Stage 4: eval becomes comparison — two realizations of the same spec scored on the same demonstrations |
| Session → skill/document feedback | Stage 4: mid-session corrections written back into the spec corpus, closing the loop |

## Open questions

- Where the clarification log lives per wave: build repo, this workspace, or the spec repo's
  review documents.
- Whether SME sign-off maps to a formal approval gate (review before fan-out) or stays a
  documented checkpoint in the usage case.
- How the method compresses for small single-prompt builds (the PDF-diff pattern) versus
  multi-wave builds — the same pipeline at different altitudes.
- Whether mechanical enforcement of the clarification gate (hook/skill) is a method concern or
  a harness mechanism — currently treated as harness, enforced by documentation only.
