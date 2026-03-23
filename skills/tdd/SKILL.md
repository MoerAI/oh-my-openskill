---
name: tdd
description: Test-first implementation workflow using red-green-refactor cycles (triggers: tdd, test first, red green refactor, write tests before code)
agent: test-engineer
license: MIT
compatibility: "opencode >= 3.0"
allowed-tools: [Read, Write, Glob]
metadata:
  portability: high
  category: quality
---

# TDD

Run development through strict red-green-refactor loops.

## Cycle

1. Write a failing test for one behavior.
2. Implement the smallest change to pass.
3. Refactor while keeping tests green.
4. Repeat for the next behavior.

## Rules

- One behavior per cycle.
- No production-only changes without a corresponding test.
- Keep tests deterministic and readable.

## Completion

- all new behavior covered by tests
- full relevant test suite passes
