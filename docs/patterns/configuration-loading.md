# Configuration Loading Pattern

Use this pattern to load config from layered sources with clear precedence.
It supports JSONC files, deep merges, and environment overrides.

## Problem

Configuration often comes from multiple locations without a merge policy.
User defaults and project overrides can conflict silently.
Environment variables may bypass validation and break runtime behavior.
JSONC parsing differences can cause inconsistent startup across tools.
Shallow merges overwrite nested settings unexpectedly.
Missing provenance makes debugging hard after final config assembly.
Teams need deterministic precedence and clear override semantics.
You need one loader that is strict, explainable, and extensible.

## Solution

Define source precedence from lowest to highest priority.
Order: user-level file, project-level file, then environment variables.
Parse file sources as JSONC to allow comments and trailing commas.
Validate parsed objects against a shared config schema.
Deep-merge objects so nested maps combine predictably.
Use replace semantics for arrays unless explicitly configured.
Apply env var mapping after file merge to finalize overrides.
Track provenance for each key (`user`, `project`, or `env`).
Reject unknown critical keys when strict mode is enabled.
Return both merged config and a diagnostics report.
Cache resolved config by hash of source mtimes and env snapshot.
Expose a debug command to print effective values and provenance.

## Example

```text
Sources:
- ~/.config/openskill/config.jsonc
- <project>/.openskill/config.jsonc
- OPENSKILL_* environment variables

Merge result:
1) parse user config
2) deep-merge project config
3) map env vars and override matched keys

Output:
- effective config object
- key provenance map
- warnings for unknown or deprecated keys
```

## When to Use

Use when both global and project config must coexist.
Use when environment-specific overrides are operationally required.
Use when nested settings need stable deep-merge behavior.
Use when startup diagnostics should explain final values.
Use when configuration must remain backward-compatible over time.
