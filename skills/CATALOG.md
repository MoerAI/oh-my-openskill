# Skills Catalog

This catalog lists all portable skills included in `oh-my-openskill`.

## Utility

| Name   | Description                                                            | Portability | Triggers                      |
| ------ | ---------------------------------------------------------------------- | ----------- | ----------------------------- |
| ask    | Guided Q&A helper for requirement clarification and execution prompts. | High        | ask, question, clarify        |
| cancel | Stops active loops, modes, or background execution safely.             | High        | cancel, stop, abort           |
| note   | Saves or updates persistent session notes and reminders.               | High        | note, remember, memo          |
| trace  | Shows execution timeline and agent activity summaries.                 | High        | trace, timeline, flow         |
| doctor | Runs environment diagnostics and setup health checks.                  | High        | doctor, diagnose, healthcheck |

## Workflow

| Name                    | Description                                                           | Portability | Triggers                        |
| ----------------------- | --------------------------------------------------------------------- | ----------- | ------------------------------- |
| learner                 | Captures reusable patterns from completed tasks for future runs.      | High        | learner, learn from run         |
| skill-manager           | Manages install, update, and validation for local skill packs.        | High        | skill-manager, manage skills    |
| project-session-manager | Handles project-scoped session lifecycle, resume, and cleanup.        | High        | session manager, resume session |
| release                 | Guides release prep, notes generation, and delivery checklist.        | High        | release, ship, publish          |
| writer-memory           | Writes docs with continuity using shared memory context.              | High        | writer-memory, memory docs      |
| ultrawork               | Executes multi-step work in parallelized high-throughput waves.       | Medium      | ultrawork, parallel execution   |
| ultraqa                 | Repeats test-verify-fix cycles until quality gates are met.           | Medium      | ultraqa, qa loop                |
| prd-init                | Bootstraps a product requirement document from goals and constraints. | Medium      | prd-init, create prd            |
| ai-slop-cleaner         | Cleans duplicated, bloated, or low-signal generated code safely.      | Medium      | cleanup, anti-slop, deslop      |

## Research

| Name                | Description                                                         | Portability | Triggers                            |
| ------------------- | ------------------------------------------------------------------- | ----------- | ----------------------------------- |
| external-context    | Pulls external references and context for implementation decisions. | High        | external context, reference         |
| parallel-research   | Runs concurrent research threads and synthesizes findings.          | Medium      | parallel-research, deepsearch       |
| multi-model-advisor | Compares recommendations across model tiers and reconciles output.  | Medium      | multi-model-advisor, compare models |

## Configuration

| Name                    | Description                                                      | Portability | Triggers                     |
| ----------------------- | ---------------------------------------------------------------- | ----------- | ---------------------------- |
| configure-notifications | Configures notification channels and event subscriptions.        | High        | notifications, alert setup   |
| mcp-setup               | Sets up MCP endpoints, credentials placeholders, and validation. | High        | mcp setup, connect mcp       |
| deepinit                | Initializes deep project scaffolding and baseline conventions.   | High        | deepinit, initialize project |

## Development

| Name    | Description                                                           | Portability | Triggers                    |
| ------- | --------------------------------------------------------------------- | ----------- | --------------------------- |
| analyze | Performs root-cause analysis and structured debugging workflows.      | High        | analyze, investigate, debug |
| tdd     | Executes test-first development loops with red-green-refactor stages. | High        | tdd, test first             |
