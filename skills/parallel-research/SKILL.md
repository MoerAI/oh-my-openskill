---
name: parallel-research
description: Agent-agnostic orchestration for staged parallel research and synthesis (triggers: parallel-research, research, investigate in parallel, multi-stage analysis)
license: MIT
compatibility: "opencode >= 3.0"
---

# Parallel Research

## Purpose

Run complex research as a staged pipeline: decompose, investigate in parallel, cross-validate, and synthesize a final report.

## Workflow

1. Decompose the goal into 3-7 independent stages.
2. Assign stage complexity tiers (low, medium, high).
3. Execute independent stages in parallel.
4. Run cross-validation to detect contradictions and coverage gaps.
5. Synthesize verified findings into a final report with evidence.

## Stage Format

Each stage should define:

- Focus question
- Hypothesis (optional)
- Scope boundaries
- Expected evidence
- Complexity tier

## Concurrency Pattern

- Run unrelated stages concurrently.
- Run validation and synthesis after parallel branches complete.
- Use batching when stage count is high to prevent resource saturation.

## Session Layout

Store artifacts under `.openskill/research/<session-id>/`:

- `state.json`
- `stages/stage-<n>.md`
- `findings/raw/`
- `findings/verified/`
- `report.md`

## State Model

Track:

- `goal`
- `status` (`in_progress`, `complete`, `blocked`, `cancelled`)
- `mode` (`standard`, `auto`)
- `iteration`
- `stages[]` with per-stage status
- `verification` result and conflicts

Use generic save/load state operations after each stage.

## Quality Requirements

- Every finding includes supporting evidence
- Confidence level is declared per finding
- Contradictions are explicitly resolved or documented
- Report includes limitations and next actions
