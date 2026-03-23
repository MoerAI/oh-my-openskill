---
name: ask
description: Ask local provider CLIs and persist reusable answer artifacts (triggers: ask, advisor, claude, codex, gemini)
agent: explore
license: MIT
compatibility: "opencode >= 3.0"
allowed-tools: [Read, Write, Glob]
metadata:
  portability: high
  category: utility
---

# Ask

Use a local provider CLI to answer a focused question, then save the response as an artifact for reuse.

## Usage

```bash
/ask <claude|codex|gemini> <question-or-task>
```

## Workflow

1. Validate provider CLI availability (`--version` and auth state).
2. Route the prompt to the selected provider.
3. Save output to `.openskill/artifacts/ask/<provider>-<slug>-<timestamp>.md`.
4. Return a short summary plus artifact path.

## Notes

- Keep prompts task-specific and bounded.
- Preserve raw output in the artifact, then add a short synthesis section.
