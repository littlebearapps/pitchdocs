---
description: "Generate AI IDE context files (AGENTS.md, CLAUDE.md, .cursorrules, copilot-instructions.md): $ARGUMENTS"
argument-hint: "[claude|agents|cursor|copilot|audit] or no args for all"
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Write
  - Edit
---

# /ai-context

Generate context files that help AI coding assistants understand your project's conventions, architecture, and constraints.

## Behaviour

1. Load the `ai-context` skill for templates and the codebase analysis workflow
2. Load the `doc-standards` rule for quality criteria
3. Run the codebase analysis: detect language, framework, test runner, linter, conventions
4. Generate the requested context file(s) from the analysis results

## Arguments

- **No arguments**: Generate all applicable context files (AGENTS.md, CLAUDE.md, .cursorrules, .github/copilot-instructions.md)
- `claude`: Generate CLAUDE.md only
- `agents`: Generate AGENTS.md only
- `cursor`: Generate .cursorrules only
- `copilot`: Generate .github/copilot-instructions.md only
- `audit`: Check existing context files for staleness and drift against the current codebase

## Output

Each generated file is written directly to disk. The audit mode reports findings without modifying files:

```
AI Context Files:
  ✓ AGENTS.md — generated (45 lines)
  ✓ CLAUDE.md — generated (38 lines)
  ✓ .cursorrules — generated (22 lines)
  ✓ .github/copilot-instructions.md — generated (30 lines)
```

Audit mode:
```
AI Context Audit:
  ✓ AGENTS.md — up to date
  ⚠ CLAUDE.md — references jest but vitest.config.ts detected
  ✗ .cursorrules — references src/index.ts but file moved to src/main.ts
  · .github/copilot-instructions.md — not present (recommend generating)
```
