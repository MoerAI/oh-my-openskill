---
name: ultraqa
description: Autonomous QA cycle for test/verify/fix loops (triggers: ultraqa, qa loop, test until pass, verify and fix)
license: MIT
compatibility: "opencode >= 3.0"
---

# UltraQA

## Purpose

Use this skill to run a bounded QA loop: execute checks, diagnose failures, apply fixes, and repeat until the quality goal is met.

## Goal Inputs

Supported goal types:

- `tests`: all test suites pass
- `build`: build succeeds
- `lint`: lint has zero errors
- `typecheck`: static type checks pass
- `custom`: command output matches a required success pattern

## Cycle (Max 5)

1. Run QA for the selected goal.
2. If pass, stop with success.
3. If fail, diagnose root cause from fresh output.
4. Apply the smallest safe fix.
5. Repeat until pass or stop condition.

## Stop Conditions

- Goal met
- Max cycles reached
- Same failure pattern repeats 3 times
- Environment-level blocker prevents execution

## Progress Output

Emit clear cycle logs, for example:

```text
[ULTRAQA Cycle 1/5] Running tests...
[ULTRAQA Cycle 1/5] FAILED - 3 tests failing
[ULTRAQA Cycle 1/5] Diagnosing root cause...
[ULTRAQA Cycle 1/5] Applying fix in auth.test.ts
[ULTRAQA Cycle 2/5] PASSED - all tests pass
```

## State Tracking

Persist loop state in `.openskill/state/ultraqa-state.json` with:

- `active`
- `goal_type`
- `goal_pattern`
- `cycle`
- `max_cycles`
- `failure_history`
- `started_at`

Save state after each cycle and remove the state file on completion or cancellation.

## Rules

- Prefer parallel diagnostics/prep work when safe
- Track failure history to detect repeating patterns
- Keep fixes narrow and verifiable
- Always clean up state artifacts when exiting
