---
name: ultrawork
description: Parallel execution pattern for independent tasks (triggers: ultrawork, ulw, parallel, run concurrently)
license: MIT
compatibility: "opencode >= 3.0"
---

# Ultrawork

## Purpose

Use this skill to execute independent work in parallel, reduce wall-clock time, and keep costs predictable with explicit task routing.

## Use When

- Multiple tasks are independent and can run concurrently
- You want faster throughput than sequential execution
- You need lightweight completion checks, not a full persistence mode

## Do Not Use When

- Work is strictly sequential with hard dependencies
- You need guaranteed completion loops with persistence and retries

## Workflow

1. Read the request and split it into independent vs dependent tasks.
2. Assign each task a reasoning tier:
   - Low: lookups, small edits, quick checks
   - Medium: standard implementation and debugging
   - High: architecture, deep root-cause analysis, risky refactors
3. Launch all independent tasks at once.
4. Run dependent tasks only after prerequisites complete.
5. Use background execution for long operations (build, install, full tests).
6. Run lightweight verification: build/typecheck/tests relevant to touched areas.

## Routing Guidance

- Prefer the lowest tier that can reliably solve the task.
- Keep prompts scoped and explicit for each parallel branch.
- Avoid assigning trivial work to high-cost/high-reasoning workers.

## Completion Checklist

- [ ] Independent tasks were actually run in parallel
- [ ] Dependent steps respected prerequisites
- [ ] Relevant checks passed
- [ ] No new errors introduced
