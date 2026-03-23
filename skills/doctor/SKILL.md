---
name: doctor
description: Diagnose installation, configuration, and cache issues, then suggest or apply safe fixes (triggers: doctor, diagnose setup, fix install, health check)
agent: debugger
license: MIT
compatibility: "opencode >= 3.0"
allowed-tools: [Read, Write, Glob]
metadata:
  portability: high
  category: maintenance
---

# Doctor

Run a structured health check for local setup and runtime configuration.

## Checks

1. Installed vs expected version.
2. Broken or duplicate hook/config entries.
3. Stale cache artifacts.
4. Missing core guidance files.
5. Legacy leftovers that conflict with current setup.

## Output

- health status table (OK/WARN/CRITICAL)
- issue list
- prioritized fix steps

## Auto-fix Rules

- Ask confirmation before destructive cleanup.
- Back up user config before rewriting.
