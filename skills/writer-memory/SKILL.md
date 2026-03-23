---
name: writer-memory
description: Persist character, relationship, scene, and theme memory for long-form writing (triggers: writer memory, character consistency, scene memory, dialogue validation)
agent: writer
license: MIT
compatibility: "opencode >= 3.0"
allowed-tools: [Read, Write, Glob]
metadata:
  portability: high
  category: domain
---

# Writer Memory

Structured memory system for fiction writing continuity.

## Storage

- `.writer-memory/memory.json`
- `.writer-memory/backups/`
- `.writer-memory/exports/`

## Commands

- `init`, `status`, `char`, `rel`, `scene`, `theme`
- `query <question>`
- `validate <character> <dialogue>`
- `synopsis`, `export`, `backup`

## Validation Focus

- character voice and tone
- relationship context
- scene emotional consistency
- theme alignment
