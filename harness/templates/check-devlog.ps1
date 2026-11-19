# Completion gate (Stop): blocks the session from stopping until devlog.md holds a cycle entry.
# Check logic is a starter — evolve it per project (e.g. require an entry dated this session).
if ((Test-Path devlog.md) -and (Select-String -Path devlog.md -Pattern '### Cycle' -Quiet)) {
  exit 0
}
@{ decision = 'block'; reason = 'devlog.md has no cycle entry — record this cycle before stopping.' } | ConvertTo-Json -Compress
