---
name: note
description: Save compact, durable session notes for future turns (triggers: note, remember this, save this, memo)
agent: writer
license: MIT
compatibility: "opencode >= 3.0"
allowed-tools: [Read, Write, Glob]
metadata:
  portability: high
  category: memory
---

# Note

Persist short-term and long-term context in a structured notepad.

## Usage

```bash
/note <content>
/note --priority <content>
/note --manual <content>
/note --show
```

## Storage

- File: `.openskill/notepad.md`
- Sections: `Priority Context`, `Working Memory`, `MANUAL`

## Rules

1. `--priority`: replace priority section with concise critical context.
2. Default mode: append timestamped working-memory entry.
3. `--manual`: append stable information that should not be auto-pruned.
4. `--show`: print current notepad content.
