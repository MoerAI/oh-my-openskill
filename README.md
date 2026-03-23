# oh-my-openskill

**Portable AI agent skills, prompts, and patterns — extracted for universal use.**

A curated collection of **22 skills**, **18 agent prompts**, reusable templates, and architectural patterns for AI coding assistants. Compatible with [oh-my-openagent](https://github.com/code-yeongyu/oh-my-openagent), [OpenCode](https://github.com/nicepkg/opencode), [Claude Code](https://docs.anthropic.com/claude-code), and any agent framework that supports the SKILL.md format.

---

## Table of Contents

- [Quick Start](#quick-start)
- [Installation Methods](#installation-methods)
- [Skills Reference](#skills-reference)
- [Agent Prompts Reference](#agent-prompts-reference)
- [oh-my-openagent Integration](#oh-my-openagent-integration)
- [Templates & Rules](#templates--rules)
- [Architecture Patterns](#architecture-patterns)
- [Creating Custom Skills](#creating-custom-skills)
- [Creating Custom Agents](#creating-custom-agents)
- [Directory Structure](#directory-structure)
- [FAQ](#faq)
- [Attribution](#attribution)

---

## Quick Start

### 1. Clone the repository

```bash
git clone https://github.com/MoerAI/oh-my-openskill.git
```

### 2. Install skills to your agent

```bash
cd oh-my-openskill
bash scripts/install.sh --global
```

### 3. Use in your project

Skills are automatically discovered by oh-my-openagent. Just invoke by name:

```
Use the tdd skill to implement this feature with test-first approach
```

---

## Installation Methods

### Method 1: Global Install (Recommended)

Makes all skills available across all your projects.

```bash
git clone https://github.com/MoerAI/oh-my-openskill.git ~/oh-my-openskill
cd ~/oh-my-openskill
bash scripts/install.sh --global
```

This creates symlinks in `~/.config/opencode/skills/` and other global discovery paths.

### Method 2: Project-Level Install

Makes skills available only in a specific project.

```bash
cd /path/to/your-project
git clone https://github.com/MoerAI/oh-my-openskill.git .openskill

# Symlink individual skills you want
ln -s "$(pwd)/.openskill/skills/tdd" .opencode/skills/tdd
ln -s "$(pwd)/.openskill/skills/ai-slop-cleaner" .opencode/skills/ai-slop-cleaner
```

Or use the install script:

```bash
cd .openskill
bash scripts/install.sh --project
```

### Method 3: Copy Specific Skills

Cherry-pick only the skills you need:

```bash
# Copy individual skills into your project's skill directory
mkdir -p .opencode/skills
cp -r oh-my-openskill/skills/tdd .opencode/skills/
cp -r oh-my-openskill/skills/ai-slop-cleaner .opencode/skills/
cp -r oh-my-openskill/skills/analyze .opencode/skills/
```

### Method 4: Git Submodule

For version-tracked integration:

```bash
git submodule add https://github.com/MoerAI/oh-my-openskill.git .openskill
bash .openskill/scripts/install.sh --project
```

### Install Script Options

```bash
# Interactive mode (prompts for path selection)
bash scripts/install.sh

# Install to all 6 discovery paths
bash scripts/install.sh --all

# Project-level only (.opencode/skills/, .claude/skills/, .agents/skills/)
bash scripts/install.sh --project

# User-level only (~/.config/opencode/skills/, ~/.config/claude/skills/, ~/.agents/skills/)
bash scripts/install.sh --global

# Uninstall (remove symlinks)
bash scripts/install.sh --uninstall
```

---

## Skills Reference

### Overview

| Category | Skills | Count |
|---|---|---|
| **Utility** | ask, cancel, note, learner, skill-manager, trace, doctor | 7 |
| **Workflow** | ultrawork, ultraqa, prd-init, ai-slop-cleaner, release | 5 |
| **Research** | external-context, parallel-research, multi-model-advisor, deepinit | 4 |
| **Configuration** | configure-notifications, mcp-setup | 2 |
| **Development** | tdd, analyze, project-session-manager, writer-memory | 4 |

### Utility Skills

#### `ask` - Multi-Model CLI Routing
Route queries to different AI CLI tools (Claude, Codex, Gemini) and save responses as reusable artifacts.

**Triggers:** `ask claude`, `ask codex`, `ask gemini`

**Usage:**
```
Use the ask skill to query Codex about architecture risks in this codebase
```

**What it does:**
- Routes your query to the specified AI CLI tool
- Captures the response as a markdown artifact
- Saves to `.openskill/artifacts/ask/` for reuse

---

#### `cancel` - Cancel Active Modes
Gracefully stop any active execution mode (ultrawork, ultraqa, etc.).

**Triggers:** `cancel`, `stop`, `abort`

**Usage:**
```
Cancel the current ultrawork session
```

---

#### `note` - Session Persistence Notes
Save quick notes during a session for later reference. Less formal than skills — useful for capturing decisions, TODOs, or context.

**Triggers:** `note`, `save note`, `remember`

**Usage:**
```
Note: We decided to use JWT tokens with httpOnly cookies for auth
```

---

#### `learner` - Extract Reusable Skills
Extract reusable workflow patterns from the current conversation and save them as new skills.

**Triggers:** `learn`, `extract skill`, `save as skill`

**Usage:**
```
Learn from this session — extract the deployment workflow we just used as a reusable skill
```

**What it does:**
- Analyzes the conversation for reusable patterns
- Creates a new SKILL.md with proper frontmatter
- Saves to your skills directory for future use

---

#### `skill-manager` - Manage Local Skills
List, add, remove, edit, and search installed skills.

**Triggers:** `manage skills`, `list skills`, `add skill`, `remove skill`

**Usage:**
```
List all installed skills
Search skills related to testing
Remove the release skill
```

---

#### `trace` - Agent Flow Timeline
View chronological timeline of agent turns, mode events, timing, and token usage for debugging agent behavior.

**Triggers:** `trace`, `show timeline`, `agent flow`

**Usage:**
```
Show me the trace of the last agent execution
```

---

#### `doctor` - Installation Diagnostics
Run diagnostic checks on your installation — verify plugin versions, skill loading, configuration, and detect common issues.

**Triggers:** `doctor`, `diagnose`, `health check`

**Usage:**
```
Run doctor to check my installation
```

---

### Workflow Skills

#### `ultrawork` - Parallel Execution
Execute independent tasks in parallel to reduce wall-clock time. Splits work into concurrent streams with smart model routing.

**Triggers:** `ultrawork`, `ulw`, `parallel`, `run concurrently`

**Usage:**
```
Use ultrawork to fix all TypeScript errors across 5 files simultaneously
```

**How it works:**
1. Analyzes the task for independent subtasks
2. Assigns each subtask to a parallel worker
3. Routes to appropriate model tier (lightweight for simple, powerful for complex)
4. Collects and merges results

---

#### `ultraqa` - QA Cycling
Iterative test-verify-fix loop that runs until all quality criteria are met (max 5 cycles).

**Triggers:** `ultraqa`, `qa cycle`, `test until pass`

**Usage:**
```
Use ultraqa to ensure all tests pass and no regressions exist
```

**Cycle:** Test -> Verify -> Fix -> Repeat (until pass or max cycles)

---

#### `prd-init` - Product Requirements Document
Initialize a structured PRD for complex features before implementation. Ensures requirements are clear before code is written.

**Triggers:** `prd`, `requirements`, `init prd`

**Usage:**
```
Create a PRD for the new payment processing feature
```

**Output:** Structured PRD with goals, requirements, acceptance criteria, and technical constraints.

---

#### `ai-slop-cleaner` - Code Cleanup
Systematically clean AI-generated bloated code while preserving behavior. Test-first, deletion-first approach.

**Triggers:** `deslop`, `anti-slop`, `ai slop`, `cleanup`

**Usage:**
```
Clean up the AI-generated code in src/services/ — remove duplication and dead code
```

**Workflow:**
1. Lock existing behavior with tests
2. Remove dead code
3. Eliminate duplication
4. Simplify abstractions
5. Verify no regressions

---

#### `release` - Automated Release
Automate the release workflow: version bump, tests, commit, tag, publish, GitHub release.

**Triggers:** `release`, `publish`, `version bump`

**Usage:**
```
Create a patch release with the current changes
```

---

### Research Skills

#### `external-context` - Web Research
Dispatch parallel research agents to gather external documentation, API references, and best practices from the web.

**Triggers:** `research`, `find docs`, `external context`, `look up`

**Usage:**
```
Research the latest Next.js 15 App Router patterns for server components
```

---

#### `parallel-research` - Multi-Agent Research
Orchestrate multiple research agents for comprehensive investigation with staged decomposition, verification, and synthesis.

**Triggers:** `deep research`, `parallel research`, `investigate thoroughly`

**Usage:**
```
Investigate authentication best practices across JWT, OAuth2, and session-based approaches
```

---

#### `multi-model-advisor` - Tri-Model Synthesis
Query Claude, Codex, and Gemini in parallel, then synthesize their responses into a unified recommendation.

**Triggers:** `multi-model`, `ask all`, `tri-model`, `ccg`

**Usage:**
```
Get architecture advice from all three models about our microservices migration
```

---

#### `deepinit` - Generate AGENTS.md
Auto-generate hierarchical AGENTS.md documentation for your entire codebase. Creates structured knowledge bases that help agents understand your project.

**Triggers:** `deepinit`, `init agents`, `generate agents.md`

**Usage:**
```
Generate AGENTS.md for this codebase
```

---

### Configuration Skills

#### `configure-notifications` - Notification Setup
Set up notification integrations for Telegram, Discord, Slack, or custom webhooks.

**Triggers:** `configure notifications`, `setup telegram`, `setup discord`, `setup slack`

**Usage:**
```
Configure Discord notifications for session completion events
```

---

#### `mcp-setup` - MCP Server Configuration
Configure popular MCP servers (Context7, Exa, Filesystem, GitHub) for your agent environment.

**Triggers:** `setup mcp`, `configure mcp`, `add mcp server`

**Usage:**
```
Set up Context7 and Exa MCP servers for documentation lookup
```

---

### Development Skills

#### `tdd` - Test-Driven Development
Enforce strict Red-Green-Refactor TDD workflow. Write failing tests first, then implement minimal code to pass.

**Triggers:** `tdd`, `test first`, `red green refactor`

**Usage:**
```
Use TDD to implement the email validation utility
```

**Workflow:**
1. **RED:** Write a failing test
2. **GREEN:** Write minimal code to pass
3. **REFACTOR:** Clean up while keeping tests green
4. Repeat

---

#### `analyze` - Root-Cause Analysis
Investigate bugs and issues with systematic root-cause analysis. Traces data flow, interprets stack traces, and isolates regressions.

**Triggers:** `analyze`, `debug`, `root cause`, `investigate bug`

**Usage:**
```
Analyze why the user authentication is failing intermittently
```

---

#### `project-session-manager` - Git Worktree Management
Manage isolated development environments using git worktrees and tmux sessions. Work on multiple features simultaneously without branch switching.

**Triggers:** `psm`, `session`, `worktree`, `teleport`

**Usage:**
```
Create a new development session for the payment-feature branch
List all active development sessions
Teleport to the auth-refactor session
```

---

#### `writer-memory` - Agentic Memory System
A JSON-based memory system for tracking characters, relationships, scenes, themes, and narrative arcs. Designed for creative writing workflows.

**Triggers:** `writer memory`, `remember character`, `story memory`

**Usage:**
```
Initialize writer memory for my novel project
Add character: Detective Kim, 45, cynical but caring, Seoul Metropolitan Police
```

---

## Agent Prompts Reference

### Overview

18 production-grade agent prompts organized by specialty:

| Lane | Agent | Role | Complexity |
|---|---|---|---|
| **Build** | `analyst` | Pre-planning requirements analysis and gap detection | High |
| **Build** | `architect` | Strategic architecture analysis and debugging advisor | High |
| **Build** | `planner` | Strategic planning consultant with interview workflow | High |
| **Build** | `executor` | Focused task implementation with autonomous exploration | Standard |
| **Build** | `explore` | Fast codebase search, file/symbol mapping | Low |
| **Build** | `debugger` | Root-cause analysis, regression isolation | Standard |
| **Review** | `code-reviewer` | Comprehensive review with severity-rated feedback | High |
| **Review** | `code-simplifier` | Code simplification for clarity and maintainability | High |
| **Review** | `critic` | Final quality gate with multi-perspective review | High |
| **Review** | `security-reviewer` | OWASP Top 10 analysis, secrets detection | High |
| **Domain** | `designer` | UI/UX designer-developer for production-grade interfaces | Standard |
| **Domain** | `document-specialist` | External documentation and reference research | Standard |
| **Domain** | `git-master` | Atomic commits, safe history operations | Standard |
| **Domain** | `scientist` | Data analysis and research with statistical rigor | Standard |
| **Domain** | `test-engineer` | Test strategy, TDD enforcement, coverage analysis | Standard |
| **Domain** | `qa-tester` | Interactive CLI testing with tmux session management | Standard |
| **Support** | `verifier` | Evidence-based completion checks and regression assessment | Standard |
| **Support** | `writer` | Technical documentation, README, API docs | Low |

### Using Agent Prompts

#### In oh-my-openagent

Agent prompts can be loaded as system prompts for specialized agent delegation:

```typescript
import { readFileSync } from 'fs';

// Load the executor agent prompt
const executorPrompt = readFileSync('agents/executor.md', 'utf-8');

// Use as system prompt when delegating implementation work
const result = await agent.delegate({
  systemPrompt: executorPrompt,
  task: 'Implement the user authentication flow',
  tools: ['read', 'write', 'bash', 'grep', 'glob'],
});
```

#### In Claude Code / OpenCode

Copy agent prompts to your project and reference them in AGENTS.md:

```bash
# Copy specific agents to your project
cp oh-my-openskill/agents/executor.md .opencode/agents/
cp oh-my-openskill/agents/architect.md .opencode/agents/
cp oh-my-openskill/agents/test-engineer.md .opencode/agents/
```

Then reference in your orchestration:

```
Use the executor agent prompt from .opencode/agents/executor.md to implement this feature
```

#### In LangChain / LlamaIndex / Custom Frameworks

```python
# Python example
with open('agents/security-reviewer.md', 'r') as f:
    security_prompt = f.read()

# Use as system message
messages = [
    {"role": "system", "content": security_prompt},
    {"role": "user", "content": "Review the auth module for vulnerabilities"}
]
```

### Agent Prompt Structure

All agent prompts follow a consistent XML structure:

```xml
<Agent_Prompt>
  <Role>
    Core role description and responsibilities
  </Role>

  <Why_This_Matters>
    Impact and importance of this role
  </Why_This_Matters>

  <Investigation_Protocol>
    How the agent explores and gathers context before acting
  </Investigation_Protocol>

  <Constraints>
    Hard rules: what the agent MUST and MUST NOT do
  </Constraints>

  <Success_Criteria>
    Measurable criteria for task completion
  </Success_Criteria>
</Agent_Prompt>
```

---

## oh-my-openagent Integration

### Skill Discovery

oh-my-openagent automatically discovers skills from these paths (in priority order):

| Priority | Path | Scope | Description |
|---|---|---|---|
| 1 | `.opencode/skills/` | Project | Project-specific skills, highest priority |
| 2 | `~/.config/opencode/skills/` | User | Global user skills for OpenCode |
| 3 | `.claude/skills/` | Project | Claude Code compatibility |
| 4 | `~/.config/claude/skills/` | User | Claude Code user-level |
| 5 | `.agents/skills/` | Project | Generic agent framework |
| 6 | `~/.agents/skills/` | User | Generic agent framework user-level |

**Priority rule:** First match wins. A project-level skill overrides a global skill with the same name.

### Automatic Loading

Once installed, skills are automatically available. The agent sees them in its tool/skill catalog and can invoke them by name or trigger keyword:

```
# By skill name
Use the tdd skill for this implementation

# By trigger keyword
Let's do test-first development for this feature

# Agent auto-selects appropriate skill based on context
Fix the AI-generated code in src/utils/ (agent may auto-select ai-slop-cleaner)
```

### SKILL.md Format Reference

```yaml
---
# Required fields
name: my-skill                    # Unique skill identifier
description: "What this skill does. Triggers: 'keyword1', 'keyword2'"

# Recommended fields
license: MIT
compatibility: "opencode >= 3.0"

# Optional fields
model: "claude-sonnet-4-6"       # Override the default model
agent: "sisyphus"                 # Target a specific agent
subtask: false                    # Mark as subtask (won't appear in top-level)
argument-hint: "task description" # Hint for what arguments to pass

# Tool restrictions (optional)
allowed-tools:
  - "bash"
  - "read"
  - "write"
  - "grep"
  - "glob"

# Custom metadata (optional)
metadata:
  category: "development"
  portability: "high"

# Embedded MCP servers (optional)
mcp:
  my-server:
    command: "node"
    args: ["server.js", "--port", "3000"]
    env:
      API_KEY: "${MY_API_KEY}"
---

# Skill Instructions

Your detailed skill instructions here in Markdown.

## When to Use
- Condition 1
- Condition 2

## Steps
1. Step one
2. Step two

## Examples
...
```

---

## Templates & Rules

### Rule Templates

Pre-built rule templates for project-scoped coding standards. Copy into your project and customize:

```bash
# Copy all rule templates
cp -r oh-my-openskill/templates/rules/ .opencode/rules/

# Or copy specific ones
cp oh-my-openskill/templates/rules/security.md .opencode/rules/
cp oh-my-openskill/templates/rules/testing.md .opencode/rules/
```

Available templates:

| Template | Description |
|---|---|
| `security.md` | OWASP-aligned security checklist, secrets detection, dependency audit rules |
| `testing.md` | Testing requirements, TDD workflow, coverage thresholds |
| `performance.md` | Performance guidelines, complexity limits, memory/latency budgets |
| `coding-style.md` | Code formatting, naming conventions, import ordering |
| `git-workflow.md` | Commit message format, branch naming, PR workflow |
| `karpathy-guidelines.md` | Think-before-coding discipline, simplicity, surgical changes |

Each template contains `[CUSTOMIZE]` markers where you should add project-specific settings.

### Agent Templates

A template system for creating new agent prompts with consistent structure:

```bash
# Create a new agent from the base template
cp oh-my-openskill/templates/agent-templates/base-agent.md agents/my-new-agent.md
```

Replace these placeholders:
- `{{AGENT_NAME}}` - Your agent's name
- `{{ROLE_DESCRIPTION}}` - What this agent does
- `{{TIER_INSTRUCTIONS}}` - Copy from `tier-instructions.md` (LOW/MEDIUM/HIGH)
- `{{TASK_SPECIFIC_INSTRUCTIONS}}` - Custom protocols
- `{{EXPECTED_DELIVERABLES}}` - What the agent outputs

### Hook Utilities

Reusable Node.js utilities for building event hooks:

| Utility | Description |
|---|---|
| `stdin.mjs` | Timeout-protected stdin reading (cross-platform, handles Windows/macOS/Linux) |
| `atomic-write.mjs` | Safe file writes using temp-file-then-rename pattern (prevents corruption) |

```javascript
import { readStdinWithTimeout } from './templates/hooks/lib/stdin.mjs';
import { atomicWrite } from './templates/hooks/lib/atomic-write.mjs';

// Read stdin with 5-second timeout
const input = await readStdinWithTimeout(5000);

// Write file atomically (safe even if process crashes mid-write)
await atomicWrite('/path/to/file.json', JSON.stringify(data));
```

### Deliverables Schema

`templates/deliverables.json` defines expected outputs for each pipeline stage:

```json
{
  "team-plan": { "required": ["task_list", "dependencies", "risk_flags"] },
  "team-prd": { "required": ["acceptance_criteria", "scope", "constraints"] },
  "team-exec": { "required": ["code_changes", "test_results"] },
  "team-verify": { "required": ["evidence", "pass_fail", "regression_check"] },
  "team-fix": { "required": ["fix_description", "retest_results"] }
}
```

---

## Architecture Patterns

### docs/patterns/

Seven concise pattern documents (Problem / Solution / Example / When to Use):

| Pattern | Description |
|---|---|
| [Model Routing](docs/patterns/model-routing.md) | Route tasks to model tiers based on complexity signals |
| [State Management](docs/patterns/state-management.md) | Standardized state persistence with atomic writes |
| [Verification Protocol](docs/patterns/verification-protocol.md) | Evidence-based task verification with checklists |
| [Task Decomposition](docs/patterns/task-decomposition.md) | Break tasks into parallelizable subtask graphs |
| [Agent Definition](docs/patterns/agent-definition.md) | Modular agent system with role/capabilities/tools |
| [Tool Registry](docs/patterns/tool-registry.md) | Schema-validated tool registration and discovery |
| [Configuration Loading](docs/patterns/configuration-loading.md) | Multi-source config with environment variable precedence |

### docs/architecture/

Detailed architecture documentation:

| Document | Description |
|---|---|
| [Tiered Agents](docs/architecture/TIERED_AGENTS_V2.md) | Model routing strategy — LOW (Haiku), MEDIUM (Sonnet), HIGH (Opus) |
| [Delegation Enforcer](docs/architecture/DELEGATION-ENFORCER.md) | Protocol for enforcing task delegation to specialized agents |
| [Sync System](docs/architecture/SYNC-SYSTEM.md) | State synchronization across multi-agent executions |

---

## Creating Custom Skills

### Step 1: Create the directory

```bash
mkdir -p .opencode/skills/my-custom-skill
```

### Step 2: Write SKILL.md

```yaml
---
name: my-custom-skill
description: "Automates my specific workflow. Triggers: 'my workflow', 'custom process'"
license: MIT
compatibility: "opencode >= 3.0"
---

# My Custom Skill

## Purpose
Describe what this skill does and when to use it.

## Steps
1. First, analyze the current state
2. Then, apply changes
3. Finally, verify the result

## Constraints
- Never modify files outside the target directory
- Always run tests after changes
```

### Step 3: Test it

```
Use my-custom-skill to process the current feature
```

---

## Creating Custom Agents

### Step 1: Copy the base template

```bash
cp templates/agent-templates/base-agent.md agents/my-agent.md
```

### Step 2: Fill in the template

Replace placeholders with your agent's specific role, constraints, and protocols.

### Step 3: Set the complexity tier

Reference `templates/agent-templates/tier-instructions.md` for appropriate tier instructions:

- **LOW (Haiku):** Fast, simple tasks, <5 files
- **MEDIUM (Sonnet):** Investigation needed, <20 files
- **HIGH (Opus):** Complex architecture, unlimited scope

---

## Directory Structure

```
oh-my-openskill/
├── skills/                              # 22 portable skills
│   ├── CATALOG.md                       # Complete skill index
│   ├── ask/SKILL.md                     # Multi-model CLI routing
│   ├── cancel/SKILL.md                  # Cancel active modes
│   ├── note/SKILL.md                    # Session notes
│   ├── learner/SKILL.md                 # Extract skills from sessions
│   ├── skill-manager/SKILL.md           # Manage installed skills
│   ├── trace/SKILL.md                   # Agent flow timeline
│   ├── doctor/SKILL.md                  # Installation diagnostics
│   ├── ultrawork/SKILL.md               # Parallel execution
│   ├── ultraqa/SKILL.md                 # QA cycling
│   ├── prd-init/SKILL.md               # PRD initialization
│   ├── ai-slop-cleaner/SKILL.md        # AI code cleanup
│   ├── release/SKILL.md                 # Automated release
│   ├── external-context/SKILL.md       # Web research
│   ├── parallel-research/SKILL.md      # Multi-agent research
│   ├── multi-model-advisor/SKILL.md    # Tri-model synthesis
│   ├── deepinit/SKILL.md               # Generate AGENTS.md
│   ├── configure-notifications/SKILL.md # Notification setup
│   ├── mcp-setup/SKILL.md              # MCP configuration
│   ├── tdd/SKILL.md                     # Test-driven development
│   ├── analyze/SKILL.md                 # Root-cause analysis
│   ├── project-session-manager/SKILL.md # Git worktree management
│   └── writer-memory/SKILL.md          # Agentic memory system
├── agents/                              # 18 agent prompts
│   ├── CATALOG.md                       # Agent index by lane
│   ├── analyst.md                       # Requirements analysis
│   ├── architect.md                     # Architecture advisor
│   ├── code-reviewer.md                 # Comprehensive review
│   ├── code-simplifier.md              # Code cleanup
│   ├── critic.md                        # Quality gate
│   ├── debugger.md                      # Bug investigation
│   ├── designer.md                      # UI/UX design
│   ├── document-specialist.md          # Documentation research
│   ├── executor.md                      # Task implementation
│   ├── explore.md                       # Codebase search
│   ├── git-master.md                    # Git operations
│   ├── planner.md                       # Strategic planning
│   ├── qa-tester.md                     # Interactive testing
│   ├── scientist.md                     # Data analysis
│   ├── security-reviewer.md            # Security audit
│   ├── test-engineer.md                 # Test strategy
│   ├── verifier.md                      # Completion verification
│   └── writer.md                        # Technical writing
├── templates/
│   ├── rules/                           # 6 project rule templates
│   │   ├── README.md
│   │   ├── coding-style.md
│   │   ├── security.md
│   │   ├── testing.md
│   │   ├── performance.md
│   │   ├── git-workflow.md
│   │   └── karpathy-guidelines.md
│   ├── hooks/lib/                       # Hook utility libraries
│   │   ├── stdin.mjs
│   │   └── atomic-write.mjs
│   ├── agent-templates/                 # Agent template system
│   │   ├── README.md
│   │   ├── base-agent.md
│   │   └── tier-instructions.md
│   └── deliverables.json                # Pipeline stage schema
├── docs/
│   ├── patterns/                        # 7 reusable pattern docs
│   │   ├── model-routing.md
│   │   ├── state-management.md
│   │   ├── verification-protocol.md
│   │   ├── task-decomposition.md
│   │   ├── agent-definition.md
│   │   ├── tool-registry.md
│   │   └── configuration-loading.md
│   ├── architecture/                    # Architecture documentation
│   │   ├── TIERED_AGENTS_V2.md
│   │   ├── DELEGATION-ENFORCER.md
│   │   └── SYNC-SYSTEM.md
│   ├── reference/                       # Reference guides
│   │   ├── shared/
│   │   └── partials/
│   └── LOW_PORTABILITY_SKILLS.md        # Excluded skills reference
├── scripts/
│   └── install.sh                       # Discovery path installer
├── .gitignore
├── LICENSE                              # MIT
└── README.md                            # This file
```

---

## FAQ

### Q: Do I need oh-my-openagent to use these skills?

**No.** Skills are plain Markdown files with YAML frontmatter. Any agent framework that can read Markdown can use them. oh-my-openagent provides automatic discovery, but you can manually load skills in any system.

### Q: Can I use just the agent prompts without the skills?

**Yes.** Agent prompts and skills are independent. Copy only what you need.

### Q: How do I update skills?

```bash
cd ~/oh-my-openskill
git pull
```

If you used symlinks (install.sh), updates are immediate. If you copied files, re-copy the updated ones.

### Q: Can I override a skill in my project?

**Yes.** Project-level skills (`.opencode/skills/`) take priority over global skills (`~/.config/opencode/skills/`). Create a skill with the same name in your project to override the global version.

### Q: What are the 12 excluded skills?

Skills tightly coupled to oh-my-claudecode runtime (autopilot, ralph, team, etc.) were excluded because they require OMC-specific infrastructure. See [docs/LOW_PORTABILITY_SKILLS.md](docs/LOW_PORTABILITY_SKILLS.md) for the full list and descriptions.

### Q: Can I contribute new skills?

**Yes!** Follow the SKILL.md format, ensure your skill is self-contained, and submit a PR.

---

## Attribution

Skills, agent prompts, and patterns extracted from [oh-my-claudecode](https://github.com/Yeachan-Heo/oh-my-claudecode) (MIT License). Adapted for universal agent compatibility.

## License

MIT
