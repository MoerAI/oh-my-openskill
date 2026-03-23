# Low Portability Skills Reference

The following skills are intentionally excluded from the portable set.
Each one depends on runtime conventions or orchestration features not guaranteed across environments.

| Skill              | What It Does                                                                 | Why Excluded                                                                        |
| ------------------ | ---------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| autopilot          | Runs a full autonomous pipeline from planning through verification.          | Tightly coupled to a specific multi-phase runtime controller and state lifecycle.   |
| ralph              | Executes persistent self-looping completion mode until strict gates pass.    | Relies on custom loop manager, mode state schema, and continuation hooks.           |
| team               | Orchestrates coordinated multi-agent stages with shared state transitions.   | Requires dedicated team pipeline engine and worker launch conventions.              |
| plan               | Triggers opinionated planning workflow with predefined artifacts and phases. | Assumes repository-level planning folders and orchestration contracts.              |
| ralplan            | Performs consensus planning using planner, architect, and critic synthesis.  | Depends on specialized consensus protocol and runtime-specific routing logic.       |
| deep-interview     | Runs Socratic requirement interviews with ambiguity gating mechanics.        | Bound to custom interview state machine and non-portable gating rules.              |
| setup              | Bootstraps environment wiring and local runtime integration.                 | Closely tied to host-specific installation paths and internal bootstrap scripts.    |
| help               | Provides runtime-aware command and capability guidance.                      | Requires introspection into internal command registry and mode state.               |
| getting-started    | Delivers guided onboarding sequence tailored to one runtime shell.           | Coupled to runtime-specific assumptions about commands and defaults.                |
| configure-openclaw | Configures a dedicated external integration profile and workflow.            | Hard-wired to integration-specific endpoints and environment expectations.          |
| hud                | Displays live execution heads-up data and mode telemetry.                    | Requires internal telemetry stream and UI event plumbing not universally available. |
| multi-agent-teams  | Launches and coordinates multi-agent teams with shared orchestration state.  | Depends on internal multi-agent scheduler and team-state persistence model.         |

## Portability Rule of Thumb

Exclude skills when they depend on runtime-managed loops, team orchestrators, or internal state engines.
Include skills when they can run as standalone workflows with generic tools and minimal host assumptions.
