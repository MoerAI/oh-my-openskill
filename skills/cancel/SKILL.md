---
name: cancel
description: Cancel active execution modes and clean mode state safely (triggers: cancel, stop, abort, reset)
agent: debugger
license: MIT
compatibility: "opencode >= 3.0"
allowed-tools: [Read, Write, Glob]
metadata:
  portability: high
  category: utility
---

# Cancel

Gracefully stop active workflows and clean related state files.

## Usage

```bash
/cancel
/cancel --all
```

## Workflow

1. Detect active modes from `.openskill/state/`.
2. Cancel in dependency order (primary orchestrator first, then linked workers).
3. Remove or mark inactive state files for cancelled modes.
4. Print a clear cancellation report.

## Safety Rules

- Default mode only touches currently active mode state.
- `--all` clears all known mode state under `.openskill/state/`.
- Never delete unrelated project files.
