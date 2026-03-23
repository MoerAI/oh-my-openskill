---
name: deepinit
description: Generate and maintain hierarchical AGENTS.md documentation across a codebase (triggers: deepinit, initialize agents docs, map codebase, agents hierarchy)
agent: writer
license: MIT
compatibility: "opencode >= 3.0"
allowed-tools: [Read, Write, Glob]
metadata:
  portability: high
  category: documentation
---

# Deepinit

Create AI-readable AGENTS.md files from root to leaf directories.

## Workflow

1. Map directories (excluding build/cache folders).
2. Generate parent AGENTS.md before child files.
3. Include parent reference tags in non-root files.
4. Preserve manual section content on regeneration.
5. Validate parent links and coverage.

## Output Quality

- accurate key-file descriptions
- clear subdirectory pointers
- practical instructions for agents working in each directory
