# Setup intake — details to confirm with the owner

Ask the owner for anything not already stated. Do not guess; a wrong project folder or
baseline is expensive to unwind.

1. **Project folder** — is this session's folder the project folder, or does the project live
   elsewhere (path)?
2. **Line name** — short name for this line of development (used in the `devlog.md` header).
3. **Prompt reference** — embed the prompt text in `prompt.md`/`devlog.md`, or cite
   `C:\Project` + revision? (Default: embed a snapshot of `C:\Project\MigrateInbound\ProjectPrompt.md`.)
4. **Baseline** — fresh build from the prompt, or modify-and-measure from a named prior
   implementation (path/ref)?
5. **First direction** — region or variable, cycle budget, approaches (if any), criteria to log
   (default: inherit previous direction's; none if this is the first).
6. **Judge model** — default: a cheap fast model (`swe` family), distinct from the builder's.
   Override?
7. **Coordinator-side gate** — if this folder is not the project folder, install the direction
   gate here as well? (Default: yes.)
