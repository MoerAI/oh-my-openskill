---
name: external-context
description: Gather external documentation and references via facet-based parallel research (triggers: external context, docs lookup, web research, compare libraries)
agent: explore
model: gpt-5.3-codex-spark
license: MIT
compatibility: "opencode >= 3.0"
allowed-tools: [Read, Write, Glob]
metadata:
  portability: high
  category: research
---

# External Context

Decompose a topic into research facets, collect evidence in parallel, then synthesize findings.

## Workflow

1. Split query into 2-5 independent facets.
2. Search each facet with official docs first.
3. Capture findings with citations.
4. Merge into one decision-ready brief.

## Output Format

- key findings
- facet-by-facet details
- source list with URLs
