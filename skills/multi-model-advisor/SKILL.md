---
name: multi-model-advisor
description: Multi-model synthesis workflow combining Claude, Codex, and Gemini perspectives (triggers: multi-model-advisor, ccg, codex and gemini, cross-model review)
license: MIT
compatibility: "opencode >= 3.0"
---

# Multi-Model Advisor

## Purpose

Collect parallel recommendations from Claude, Codex, and Gemini, then synthesize a single actionable direction.

## When to Use

- Mixed backend + UX decisions
- Architecture and design tradeoff reviews
- Cross-validation when one model's blind spots matter

## Workflow

1. Decompose the request into model-focused prompts:
   - Codex: correctness, architecture, implementation risk
   - Gemini: UX clarity, alternatives, usability edge cases
   - Claude: synthesis and final decision framing
2. Run Codex and Gemini prompts in parallel.
3. Collect their outputs as artifacts.
4. Synthesize:
   - Agreements
   - Conflicts
   - Final chosen direction and rationale
   - Execution checklist

## Artifact Convention

Store model outputs under `.openskill/artifacts/advisors/`:

- `codex-<timestamp>.md`
- `gemini-<timestamp>.md`
- `synthesis-<timestamp>.md`

## Fallback Rules

- If one advisor is unavailable, proceed with available advisors and note missing perspective risk.
- If only one external advisor is available, still produce a synthesis with explicit confidence limits.
- If no external advisors are available, provide Claude-only guidance and clearly state reduced triangulation.
