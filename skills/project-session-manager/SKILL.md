---
name: project-session-manager
description: Manage isolated work sessions with git worktrees and tmux (triggers: psm, worktree session, parallel branch, isolated workspace)
agent: executor
license: MIT
compatibility: "opencode >= 3.0"
allowed-tools: [Read, Write, Glob]
metadata:
  portability: high
  category: workflow
---

# Project Session Manager

Create isolated development sessions for review, fix, and feature work.

## Commands

- `review <ref>`
- `fix <ref>`
- `feature <project> <name>`
- `list`, `attach <session>`, `kill <session>`, `cleanup`, `status`

## Core Workflow

1. Resolve reference to repository + issue/PR context.
2. Create or reuse a git worktree.
3. Start or attach tmux session for that worktree.
4. Store metadata in `~/.psm/sessions.json` and `.psm-session.json`.
5. Provide attach/cleanup commands.

## Requirements

- `git` with worktree support
- `tmux` (recommended)
- provider CLI for issue/PR lookup (for example `gh`)
