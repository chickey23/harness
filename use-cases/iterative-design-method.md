# Usage case — the iterative design method on the harness

Provisional, 2026-11-16. Non-normative: describes the development process as exercised through
the harness; it does not define requirements. Distinct from the harness itself — this is the
method that runs on it.

## The method

A controlled-document pipeline applied to agent instructions:

1. **Requirements intake** — purpose, scope, and constraints captured in a spec document, not in
   session chat.
2. **Clarification to exhaustion** — every open decision enumerated as a question before planning;
   no fixed cap on clarifying questions. The clarification log is a versioned artifact.
3. **Gated build** — the spec passes through external validation (test, SME sign-off, values and
   design-criteria check) before it is allowed to drive a build.
4. **Evaluation and restart** — the build is evaluated against the spec; what failed feeds back
   into the spec document, which is revised, not the chat.

The product that compounds is the spec corpus; sessions and prompts are disposable projections
of it.

## How the harness serves it

| Mechanism | Role in this method |
|---|---|
| Spec repo + build repo topology | Spec stays versioned and read-only during a build wave; the build repo is disposable |
| Wave prompts citing spec by identifier | A session prompt stays small because it addresses the spec, not restates it |
| Clarification gate (rules + skills) | Enforces exhaustion where agent defaults cap questions |
| Parallel implementations + evaluation model | The eval step becomes comparison: two realizations of the same spec, scored on the same demonstrations |
| Session → skill/document feedback | Mid-session corrections are written back into the spec corpus, closing the loop |

## Open questions

- Where the clarification log lives per wave: build repo, this workspace, or the spec repo's
  review documents.
- Whether SME sign-off maps to a formal approval gate (review before fan-out) or stays a
  documented checkpoint in the usage case.
- How the method compresses for small single-prompt builds (the PDF-diff pattern) versus
  multi-wave builds — the same pipeline at different altitudes.
