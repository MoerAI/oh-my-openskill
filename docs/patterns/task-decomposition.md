# Task Decomposition Pattern

Use this pattern to split broad work into parallelizable subtasks.
It reduces coordination overhead while preserving integration quality.

## Problem

Large tasks are often assigned as one undifferentiated unit.
Contributors block each other by editing the same files.
Hidden dependencies appear late and delay delivery.
Parallel execution fails when ownership boundaries are unclear.
Review becomes difficult when diffs mix unrelated concerns.
Testing is delayed until all code merges, increasing risk.
Progress tracking is vague without explicit subtask states.
Teams need a graph that reveals safe parallel waves.
You need decomposition that supports both speed and control.

## Solution

Start by identifying functional components from the goal statement.
Map each component to primary files and integration points.
Assign file ownership to avoid overlapping write zones.
Create atomic subtasks sized for one focused change set.
Label dependencies between subtasks as required or optional.
Build a directed acyclic graph from the dependency list.
Group independent nodes into execution waves.
Run same-wave subtasks in parallel with shared completion criteria.
After each wave, integrate and run targeted verification.
Carry unresolved defects forward as explicit follow-up nodes.
Recompute waves whenever scope changes or blockers appear.
Finalize with a merge wave for docs, tests, and cleanup.

## Example

```text
Goal: add configurable tool registry filtering

Components:
- config loading
- registry filtering
- docs update

Ownership:
- config loading -> src/config/*
- registry filtering -> src/tools/registry/*
- docs update -> docs/*

Graph:
config loading -> registry filtering
docs update (independent)

Waves:
Wave 1: config loading + docs update
Wave 2: registry filtering
Wave 3: integration tests
```

## When to Use

Use when tasks touch three or more logical components.
Use when multiple contributors or agents can run in parallel.
Use when file conflicts frequently slow delivery.
Use when you need visible progress by subtask and wave.
Use when integration risk must be managed incrementally.
