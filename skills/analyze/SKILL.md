---
name: analyze
description: Deep debugging and root-cause analysis workflow for failing behavior (triggers: analyze, debug deeply, root cause, why failing)
agent: debugger
license: MIT
compatibility: "opencode >= 3.0"
allowed-tools: [Read, Write, Glob]
metadata:
  portability: high
  category: debugging
---

# Analyze

Perform structured diagnosis before attempting a fix.

## Workflow

1. Reproduce failure and capture exact error signals.
2. Trace data flow and control flow around failing path.
3. Isolate likely root causes and rank by evidence.
4. Validate root cause with a focused check.
5. Propose minimal, verifiable fix.

## Output

- observed behavior
- root cause statement
- proof used to confirm cause
- safest fix plan
