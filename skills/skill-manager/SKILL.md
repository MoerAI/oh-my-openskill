---
name: skill-manager
description: Manage local skills across user and project scope (triggers: skill list, skill add, skill edit, skill remove, skill search)
agent: executor
license: MIT
compatibility: "opencode >= 3.0"
allowed-tools: [Read, Write, Glob]
metadata:
  portability: high
  category: utility
---

# Skill Manager

Meta-skill for creating, updating, discovering, and organizing skills.

## Commands

- `/skill-manager list`
- `/skill-manager add <name>`
- `/skill-manager edit <name>`
- `/skill-manager remove <name>`
- `/skill-manager search <query>`
- `/skill-manager info <name>`
- `/skill-manager sync`

## Scopes

- User: `~/.claude/skills/openagent-learned/`
- Project: `.openskill/skills/`

## Rules

1. Parse and preserve YAML frontmatter.
2. Confirm before destructive actions.
3. Prefer portable naming: lowercase, hyphenated skill names.
