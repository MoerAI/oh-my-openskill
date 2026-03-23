# Verification Protocol Pattern

Use this pattern to verify outcomes with evidence, not intuition.
It links goals to measurable checks and explicit pass or fail reports.

## Problem

Teams often mark tasks complete without proving key claims.
Results vary because success criteria are implied, not documented.
A passing unit test alone may hide integration regressions.
Manual spot checks are inconsistent across reviewers.
Evidence is scattered in logs, diffs, and local notes.
Failed checks may be ignored when deadlines are tight.
Stakeholders cannot audit why a change was accepted.
Retrospective debugging is harder without verification artifacts.
You need a repeatable protocol with explicit evidence capture.

## Solution

Define success criteria before implementation begins.
Translate each criterion into one or more concrete checks.
Build a checklist that includes functional and non-functional gates.
Assign an evidence source to each check (test output, metric, screenshot).
Run checks in stable order: lint, types, tests, integration, policy.
Capture outputs in a single report structure.
Mark each check as pass, fail, or blocked.
Fail the whole task if any required check fails.
Allow exceptions only with an explicit waiver field.
Attach artifacts and command references to every checklist row.
Generate a final verdict with risk notes and follow-up actions.
Store the report with the task record for traceability.

## Example

```text
Success criteria:
1) Feature works for primary workflow
2) No regression in existing auth paths
3) No type or lint violations

Checklist execution:
- npm run lint -> pass (artifact: lint.log)
- npm run typecheck -> pass (artifact: tsc.log)
- npm test auth.spec.ts -> pass (artifact: junit.xml)
- manual login smoke test -> pass (artifact: screenshot.png)

Final report:
- required checks passed: 4/4
- waived checks: 0
- verdict: PASS
```

## When to Use

Use for any change that claims correctness or quality improvements.
Use when multiple reviewers need shared completion criteria.
Use when releases require auditable decision records.
Use when regressions are costly and early detection matters.
Use when compliance requires evidence-backed acceptance.
