# Agent Definition Pattern

Use this pattern to create modular, composable agent definitions.
It standardizes role intent, execution boundaries, and workflow wiring.

## Problem

Ad hoc agent prompts drift in behavior over time.
Roles overlap when capabilities are not explicitly scoped.
Tool misuse increases when restrictions are undocumented.
Model tiers are chosen inconsistently per agent run.
Workflows break when agent contracts are implicit.
Catalogs become stale without structured registration fields.
New contributors cannot safely extend the agent system.
Operational quality drops when responsibilities are ambiguous.
You need a schema for defining and composing agents.

## Solution

Define each agent as structured metadata plus execution guidance.
Required fields: role, objective, capabilities, constraints, model tier.
Add tool allowlist or denylist to enforce runtime boundaries.
Declare input contract and expected output format.
Tag each capability with confidence and evidence requirements.
Map model tier to low, medium, or high complexity workloads.
Register every definition in a central agent catalog file.
Validate schema before loading definitions into runtime.
Compose workflows by selecting complementary agents per stage.
Use explicit handoff artifacts between adjacent agents.
Version agent definitions to track behavior changes.
Review capability drift during periodic catalog audits.

## Example

```yaml
name: verifier
role: Evidence-based completion validator
model_tier: medium
capabilities:
  - run verification checklist
  - summarize pass or fail evidence
tool_restrictions:
  allow: [read, grep, bash]
input_contract:
  requires: [task_scope, success_criteria, artifacts]
output_contract:
  produces: [verdict, failed_checks, next_actions]
```

## When to Use

Use when building reusable multi-agent workflows.
Use when you must enforce tool safety by role.
Use when model spending needs role-level governance.
Use when onboarding requires predictable agent behavior.
Use when catalog-driven composition is preferred over custom prompts.
