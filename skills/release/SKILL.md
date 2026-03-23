---
name: release
description: Run a repeatable release checklist with version bump, validation, and publish steps (triggers: release, publish, version bump, tag)
agent: executor
license: MIT
compatibility: "opencode >= 3.0"
allowed-tools: [Read, Write, Glob]
metadata:
  portability: high
  category: delivery
---

# Release

Execute a safe, auditable release process.

## Usage

```bash
/release <version|patch|minor|major>
```

## Checklist

1. Update version references in manifest, docs, and runtime constants.
2. Run tests and build checks.
3. Commit release changes with a clear message.
4. Create and push a git tag.
5. Publish package artifact.
6. Create release notes.

## Rules

- Do not skip verification before publishing.
- Fail fast on test/build errors.
- Keep release notes focused on user-visible changes.
