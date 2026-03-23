---
name: mcp-setup
description: Configure common MCP servers for docs, web search, filesystem, and repository access (triggers: mcp setup, add mcp, context7, exa, github mcp)
agent: executor
license: MIT
compatibility: "opencode >= 3.0"
allowed-tools: [Read, Write, Glob]
metadata:
  portability: high
  category: integration
---

# MCP Setup

Install and validate high-value MCP servers in a guided flow.

## Recommended Servers

- Context7 (documentation context)
- Exa search
- Filesystem server
- GitHub server

## Workflow

1. Ask which servers to configure.
2. Gather required tokens or directory scopes.
3. Add servers via host MCP CLI (`mcp add ...`).
4. Verify with `mcp list`.
5. Provide quick usage examples and troubleshooting tips.
