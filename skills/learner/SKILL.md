---
name: learner
description: Extract reusable, high-signal skills from resolved sessions (triggers: learner, extract skill, save pattern, hard-won insight)
agent: analyst
license: MIT
compatibility: "opencode >= 3.0"
allowed-tools: [Read, Write, Glob]
metadata:
  portability: high
  category: knowledge
---

# Learner

Turn a solved problem into a reusable skill with clear triggers and an actionable approach.

## Acceptance Bar

Only extract when the insight is:

- non-obvious,
- specific enough to apply reliably,
- costly to rediscover.

## Output Structure

1. Problem signal (symptom, context, failure pattern)
2. Core insight (mental model)
3. Recognition pattern (when to apply)
4. Approach (decision process)
5. Optional example

## Save Paths

- User scope: `~/.claude/skills/openagent-learned/<name>/SKILL.md`
- Project scope: `.openskill/skills/<name>/SKILL.md`
