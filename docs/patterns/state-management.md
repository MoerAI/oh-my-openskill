# State Management Pattern

Use this pattern to manage runtime state across local and user scopes.
It keeps writes safe, reads fast, and migrations controlled.

## Problem

State files are often scattered across ad hoc directories.
Tools fail when project-local and user-global state conflict.
Non-atomic writes can corrupt JSON during crashes or interruptions.
Repeated file reads increase latency for frequent state checks.
Schema changes break older state files without migration guards.
Concurrent processes can overwrite each other without detection.
Manual cleanup is error-prone and hard to audit.
Path differences across platforms cause inconsistent behavior.
You need one policy for location, lifecycle, and durability.

## Solution

Define two roots and resolve them consistently at startup.
Local root: `.openskill/state/` inside the current project.
Global root: `~/.config/openskill/state/` for user-level persistence.
Prefer local state for project-bound workflows and task sessions.
Use global state for user preferences and cross-project context.
Write state atomically via temp file plus rename operation.
Store a `schema_version` field in every state document.
Run migrations on load when file version is below current version.
Keep a short-lived in-memory cache with mtime validation.
Invalidate cache after writes and on explicit refresh signals.
Use file locks or lock files for concurrent writer protection.
Keep migration functions idempotent and reversible when possible.
Log migration results for diagnostics and supportability.

## Example

```text
resolveStatePath(scope, key):
  if scope == "local":
    return <project>/.openskill/state/<key>.json
  return ~/.config/openskill/state/<key>.json

writeAtomic(path, json):
  tmp = path + ".tmp"
  write(tmp, json)
  fsync(tmp)
  rename(tmp, path)

loadState(path):
  data = read(path)
  if data.schema_version < CURRENT:
    data = migrate(data)
  cache.put(path, data, mtime(path))
  return data
```

## When to Use

Use when tools run in both project and user contexts.
Use when state durability matters across crashes and restarts.
Use when schema evolution is expected over time.
Use when high-frequency reads benefit from safe caching.
Use when multiple processes may write state concurrently.
