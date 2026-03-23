---
name: configure-notifications
description: Configure Telegram, Discord, Slack, or webhook notifications interactively (triggers: configure notifications, setup telegram, setup discord, setup slack, webhook alerts)
agent: executor
license: MIT
compatibility: "opencode >= 3.0"
allowed-tools: [Read, Write, Glob]
metadata:
  portability: high
  category: integration
---

# Configure Notifications

Interactive setup for notification channels used by long-running workflows.

## Providers

- Telegram (bot token + chat id)
- Discord (webhook or bot token + channel id)
- Slack (incoming webhook)
- Generic webhook/CLI integration

## Workflow

1. Detect existing config in `~/.claude/.openskill-config.json`.
2. Ask provider-specific setup questions.
3. Validate credentials/URLs.
4. Configure event subscriptions (session start/end/input-needed).
5. Write merged config and offer a test notification.

## Rules

- Never log secrets in plain output.
- Keep disabled events explicit in config.
