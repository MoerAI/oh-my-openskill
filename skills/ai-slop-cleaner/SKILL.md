---
name: ai-slop-cleaner
description: Clean AI-generated code slop with a test-first, deletion-first cleanup workflow (triggers: deslop, anti-slop, ai slop, cleanup)
license: MIT
compatibility: "opencode >= 3.0"
---

# AI Slop Cleaner

## Purpose

Systematically clean bloated AI-generated code while preserving intended behavior.

## Use When

- Code has dead branches, duplicate logic, or unnecessary wrappers
- Boundaries are blurry and responsibilities are misplaced
- Regression coverage is weak for existing behavior

## Execution Policy

- Preserve behavior unless changes are explicitly requested
- Lock behavior with regression tests before cleanup when practical
- Write a cleanup plan before editing code
- Prefer deletion over addition
- Reuse existing utilities and conventions
- Avoid new dependencies unless explicitly requested
- Keep writer and reviewer passes separate

## Cleanup Passes

1. Dead code deletion
2. Duplicate consolidation
3. Naming and error-handling normalization
4. Test reinforcement for changed paths

Run one smell-focused pass at a time.

## Review Mode (`--review`)

Reviewer-only pass checks:

- leftover dead code and unused exports
- duplicate logic not consolidated
- needless abstractions still present
- boundary violations
- missing or weak regression coverage

If issues remain, send required follow-ups to a separate writer pass.

## Verification Gates

- lint
- typecheck
- relevant unit/integration tests
- static/security checks already present in the project

## Report Format

Always report:

- Changed files
- Simplifications made
- Verification run
- Remaining risks
