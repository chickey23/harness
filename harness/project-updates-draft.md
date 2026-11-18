# Proposed `C:\Project` updates — draft for owner review

Provisional, 2026-11-16. Non-normative. Drafted in this workspace per the develop-here,
apply-there convention: the owner edits, approves, and adopts through the spec corpus's own
revision process. **All three changes applied to `C:\Project` on owner direction, 2026-11-16.**

Two proposed changes: revise `D-DevelopmentHarness` to match the settled operating model, and
add an evaluability requirement to `ProjectPrompt.md` so builds can be machine-scored later.

## 1. `MigrateInbound/DESIGN_CHOICES.md` — replace `D-DevelopmentHarness`

Current text describes candidate mechanisms without selecting among them. Proposed replacement:

> ## D-DevelopmentHarness: Realize successive or competing implementations in separate repositories against the shared Project Prompt, coordinated by a documented development harness.
>
> Developer-classified process realization, provisional 2026-11-16. Independent codebases are
> developed from the same spec rather than by continued modification of a predecessor;
> GreyAvatar remains a reference realization and does not pass its choices forward. The harness
> refines toward a prompt: the prompt is the object under refinement and implementations are
> disposable evidence. One cycle iterates the entire application and scores it against a common
> rubric. The rubric evolves; each scored cycle records the rubric revision that judged it. The
> working default is local to the harness workspace: user satisfaction, with user ranking
> required across a project's accumulated candidates. Machine assessment of objective criteria
> is anticipated through judge-type models once the prompt requires accessible logging of named
> criteria (see the evaluability requirement in ProjectPrompt.md); owner scoring remains the
> authority until then.
>
> Two operating modes: a scoring run — the default when no criteria are given — and guided
> evolution, in which a human direction names a region or variable to improve, a cycle budget,
> and a baseline (build fresh from the prompt, or modify-and-measure from a chosen prior
> implementation). When several approaches are wanted, the agent proposes candidates and the
> owner picks at review. Directions are clarified sufficiently before cycles run; ambiguous
> directions are rejected as inadequate. A failed cycle is recorded; failure does not trigger an
> automatic rebuild.
>
> Each project keeps a continuous development log in its own project folder — outside the spec
> corpus and outside the harness workspace — recording per cycle a reference to the prompt, the
> evaluation criteria applied and their revision, the results, and the governing user
> directions. Results inform prompt revisions at review points: the harness session drafts
> proposed amendments and the owner edits and approves; adoption follows this corpus's revision
> process. Log closure is user-directed (points of no return: completion, splits); a split is a
> new start with its own project folder and log. Dev/test data may live outside both workspaces.
>
> Behavioral comparison follows the EvaluationModel publication when it exists; until then the
> local rubric and demonstration review are informal. Relates to E-EssentialExperience,
> E-Codebase, E-Exchange, and E-Adaptation.

## 2. `MigrateInbound/ProjectPrompt.md` — add evaluability requirement

Proposed insertion at the end of §Observable demonstrations, after the closing sentence
("These demonstrations are evidence of the required behavior…"):

> An implementation is expected to expose observable evidence for criteria named by the review
> process — logs, records, or other accessible artifacts — in a form external assessment,
> including machine assessment, can consume. The set of named criteria is supplied with each
> evaluation direction and may change between runs; the accessible form is an implementation
> choice.

Rationale: machine assessment of objective criteria (anticipated JEV-type judging) is only
possible if every build emits the required evidence. Stating it here makes evaluability a
requirement of the prompt rather than a request of the harness.

## 3. Optional — `MigrateInbound/InstructionsForEvaluationModel.txt`

Not required. When the EvaluationModel publication is drafted, note that a local working rubric
predates it in the harness workspace (`C:\Harness\harness\rubric.md`) — the publication subsumes
or supersedes it rather than starting from nothing. Could be recorded as a candidate use or
left to that document's own development.
