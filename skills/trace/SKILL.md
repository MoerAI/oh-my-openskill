---
name: trace
description: Inspect orchestration history via timeline and summary views (triggers: trace, timeline, flow audit, execution summary)
agent: explore
license: MIT
compatibility: "opencode >= 3.0"
allowed-tools: [Read, Write, Glob]
metadata:
  portability: high
  category: observability
---

# Trace

Use trace data to understand what happened during orchestration.

## Workflow

1. Show chronological events with `trace_timeline`.
2. Show aggregate metrics with `trace_summary`.
3. Correlate bottlenecks, retries, and failure points.
4. Output actionable next steps.

## Recommended Output

- key events in order
- most frequent failure/tool bottlenecks
- mode transitions
- concise remediation plan
