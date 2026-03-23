# Agents Catalog

This catalog lists all portable agents and their primary use cases.

## Build/Analysis Lane

| Name      | Role                                                        | Model Tier | Key Capabilities                                               |
| --------- | ----------------------------------------------------------- | ---------- | -------------------------------------------------------------- |
| explore   | Fast codebase mapper and context collector.                 | Low        | file discovery, symbol mapping, dependency tracing             |
| analyst   | Requirement clarifier and acceptance criteria definer.      | Medium     | scope framing, constraints extraction, risk surfacing          |
| planner   | Execution plan builder with sequencing and dependencies.    | Medium     | task decomposition, milestone design, ordering logic           |
| architect | System design lead for boundaries and interfaces.           | High       | architecture decisions, tradeoff analysis, interface contracts |
| executor  | Primary implementation agent for feature and refactor work. | Medium     | code changes, integration updates, incremental delivery        |
| debugger  | Root-cause investigator for failures and regressions.       | Medium     | failure isolation, hypothesis testing, fix validation          |
| verifier  | Completion validator focused on evidence-based outcomes.    | Medium     | checklist verification, artifact review, verdict reporting     |

## Review Lane

| Name              | Role                                                            | Model Tier | Key Capabilities                                                 |
| ----------------- | --------------------------------------------------------------- | ---------- | ---------------------------------------------------------------- |
| code-reviewer     | Broad code quality reviewer for defects and maintainability.    | Medium     | logic review, readability checks, change risk notes              |
| security-reviewer | Security-focused reviewer for trust boundaries and abuse paths. | High       | threat review, auth checks, secret handling audits               |
| code-simplifier   | Simplifies over-engineered code while preserving behavior.      | Medium     | duplication removal, abstraction reduction, clarity improvements |
| critic            | Independent challenger for plans and design assumptions.        | High       | adversarial review, blind-spot detection, alternative proposals  |

## Domain Specialist Lane

| Name                | Role                                                              | Model Tier | Key Capabilities                                           |
| ------------------- | ----------------------------------------------------------------- | ---------- | ---------------------------------------------------------- |
| git-master          | Git workflow specialist for history and change hygiene.           | Medium     | commit strategy, branch hygiene, conflict guidance         |
| qa-tester           | Runtime behavior tester for interactive or manual flows.          | Medium     | scenario validation, bug reproduction, evidence capture    |
| test-engineer       | Automated test strategy and implementation specialist.            | Medium     | coverage planning, test authoring, flaky test hardening    |
| writer              | Documentation specialist for technical and user-facing content.   | Low        | docs drafting, migration notes, usage guidance             |
| document-specialist | Structured document editor for catalogs and reference artifacts.  | Low        | table design, consistency checks, information architecture |
| scientist           | Research-oriented evaluator for experiments and findings quality. | High       | experiment design, evidence synthesis, hypothesis analysis |

## Product Lane

| Name     | Role                                                    | Model Tier | Key Capabilities                                               |
| -------- | ------------------------------------------------------- | ---------- | -------------------------------------------------------------- |
| designer | UX and interaction design specialist for product flows. | Medium     | interaction patterns, usability improvements, visual direction |
