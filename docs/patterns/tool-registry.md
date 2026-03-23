# Tool Registry Pattern

Use this pattern to register tools with schema safety and filtering.
It ensures predictable invocation, validated input, and stable discovery.

## Problem

Tool definitions drift when input validation is optional.
Runtime errors increase from malformed arguments and missing fields.
Different SDKs expect different message formats and naming conventions.
Uncategorized tools are hard to discover and govern.
Unsafe tools may be exposed to roles that should not use them.
Registry output becomes inconsistent across environments.
Adding new tools often requires fragile boilerplate.
You need one contract from registration to invocation payload.

## Solution

Define a registry entry schema with Zod for each tool.
Include id, description, category, schema, and execution handler.
Validate all incoming arguments before handler execution.
Convert validated input to the target SDK invocation format.
Normalize tool metadata into a common internal shape.
Support category filters such as `io`, `analysis`, `network`, `git`.
Allow role-based filtering by combining category and policy rules.
Expose a deterministic list order for reproducible selection.
Cache resolved registry views per role and invalidation key.
Fail fast on schema mismatch with actionable error messages.
Test conversion logic with fixtures for each supported SDK.
Document category semantics to keep registrations consistent.

## Example

```ts
const ReadArgs = z.object({ filePath: z.string().min(1) });

registerTool({
  id: "read",
  description: "Read file content",
  category: "io",
  schema: ReadArgs,
  toSdkFormat: (args) => ({ name: "read", input: args }),
  run: (args) => readFile(args.filePath),
});

const allowed = listTools({ categories: ["io", "analysis"], role: "executor" });
```

## When to Use

Use when a runtime exposes many tools across domains.
Use when you need strong argument validation at boundaries.
Use when tool calls must be converted for multiple SDKs.
Use when role or category filtering is a governance requirement.
Use when registry behavior must be testable and deterministic.
