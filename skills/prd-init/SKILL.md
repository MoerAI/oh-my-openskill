---
name: prd-init
description: Initialize a generic Product Requirements Document workflow (triggers: prd-init, initialize prd, start requirements, product requirements)
license: MIT
compatibility: "opencode >= 3.0"
---

# PRD Init

## Purpose

Initialize a task-specific Product Requirements Document that turns a broad goal into actionable, testable work items.

## Workflow

1. Parse the user goal, constraints, and success definition.
2. Decompose the goal into user stories with clear scope boundaries.
3. Write concrete acceptance criteria per story (no generic placeholders).
4. Add risks, assumptions, dependencies, and non-goals.
5. Produce an execution-ready PRD artifact and a matching test-spec artifact.

## Output Artifacts

Create:

- `.openskill/plans/prd-<timestamp>.md`
- `.openskill/plans/test-spec-<timestamp>.md`

## PRD Template

```markdown
# Product Requirements Document

## Goal

<what is being built and why>

## Scope

- In scope: ...
- Out of scope: ...

## User Stories

### US-001: <story title>

- Description: ...
- Acceptance Criteria:
  - [ ] ...
  - [ ] ...

## Constraints

- Technical constraints: ...
- Business constraints: ...

## Risks and Mitigations

- Risk: ...
  - Mitigation: ...

## Milestones

1. ...
2. ...
```

## Test Spec Template

For each user story, define validation steps that directly map to acceptance criteria:

- unit checks
- integration checks
- build/type/lint gates
- manual verification where automation is not practical

## Quality Rules

- Acceptance criteria must be observable and falsifiable
- Avoid vague criteria like "implementation complete"
- Keep stories right-sized so each can be completed and verified independently
