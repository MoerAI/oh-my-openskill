# Model Routing Pattern

Use this pattern to map task complexity to model tiers without guessing.
It converts observable signals into a repeatable routing decision.

## Problem

Teams often overuse high-tier models for simple tasks.
They also under-route complex, cross-file tasks to weak tiers.
Routing by intuition creates cost drift and unstable output quality.
Different contributors apply different standards for "hard" tasks.
Prompt size alone is not a reliable complexity indicator.
Some short tasks are structurally deep and need stronger reasoning.
Some large tasks are boilerplate and can run on low-tier models.
Without shared routing rules, performance and latency become noisy.
You need a deterministic method that explains each tier selection.

## Solution

Extract two signal groups before assigning a model tier.
Lexical signals include words like "refactor", "architecture", or "security".
Structural signals include files touched, dependency depth, and verification scope.
Normalize each signal to a fixed scale (for example 0 to 3).
Apply weighted scoring so structural signals dominate lexical hints.
Compute `complexity_score = lexical_score * 0.4 + structural_score * 0.6`.
Map score bands to tiers: `0-1.2 low`, `1.3-2.1 medium`, `2.2-3.0 high`.
Use low tier for bounded edits, formatting, and known transformations.
Use medium tier for multi-file features and routine debugging.
Use high tier for architecture, risky migrations, and ambiguous requirements.
Record the scored signals and final decision for auditability.
Override only when a hard constraint exists (deadline, budget cap, policy).
Recalibrate weights monthly using quality and latency outcomes.

## Example

```text
Task: "Refactor auth middleware and preserve backward compatibility"

Lexical signals:
- refactor = 2
- backward compatibility = 3
Lexical score = (2 + 3) / 2 = 2.5

Structural signals:
- estimated files touched = 5 -> 2
- public API impact = yes -> 3
- required verification breadth = integration + regression -> 3
Structural score = (2 + 3 + 3) / 3 = 2.67

Complexity score = 2.5 * 0.4 + 2.67 * 0.6 = 2.60
Selected tier = high
```

## When to Use

Use for any system with multiple model tiers.
Use when cost and latency are both tracked operational metrics.
Use when contributors need a shared standard for task difficulty.
Use when routing decisions must be reviewable after execution.
Use when you need predictable quality under changing workloads.
