---
description: "Install, uninstall, or check status of Context Guard hooks for AI context file freshness: $ARGUMENTS"
argument-hint: "[install|uninstall|status] — Claude Code only"
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Write
  - Edit
---

# /context-guard

Install opt-in hooks that detect stale AI context files and remind you to update them. **Claude Code only** — these hooks use Claude Code's PostToolUse hook system, which is not supported by OpenCode, Codex CLI, or other AI coding tools.

## Behaviour

1. Load the `context-guard` skill for reference
2. Execute the requested action: `install`, `uninstall`, or `status`

## Arguments

- **`install`**: Install Context Guard into the current project:
  1. Create `.claude/hooks/` directory if it does not exist
  2. Copy `context-drift-check.sh` and `context-structural-change.sh` from the plugin's `hooks/` directory to `.claude/hooks/`
  3. Make the scripts executable (`chmod +x`)
  4. Merge PostToolUse hook entries into `.claude/settings.json` (create the file if needed; if PostToolUse entries already exist, append without overwriting)
  5. Copy `context-quality.md` to `.claude/rules/context-quality.md` (create directory if needed)
  6. Report what was installed

- **`uninstall`**: Remove Context Guard from the current project:
  1. Remove `.claude/hooks/context-drift-check.sh` and `.claude/hooks/context-structural-change.sh`
  2. Remove the Context Guard hook entries from `.claude/settings.json` (preserve other hooks)
  3. Remove `.claude/rules/context-quality.md`
  4. Report what was removed

- **`status`**: Check installation state and current drift:
  1. Check if hook scripts exist in `.claude/hooks/`
  2. Check if hook entries are present in `.claude/settings.json`
  3. Check if the quality rule exists in `.claude/rules/`
  4. Run a quick drift check (same logic as `/ai-context audit`) to report current staleness
  5. Report findings

## Output

### Install
```
Context Guard installed:
  ✓ .claude/hooks/context-drift-check.sh — warns after commits if context files are stale
  ✓ .claude/hooks/context-structural-change.sh — reminds after structural file changes
  ✓ .claude/rules/context-quality.md — auto-loaded quality standards for context files
  ✓ .claude/settings.json — PostToolUse hooks registered

Note: These hooks are Claude Code-specific. If your team also uses OpenCode or
Codex CLI, the hooks will be ignored by those tools (no errors, just no effect).
Add .claude/hooks/ to .gitignore if you prefer hooks to be per-developer.
```

### Status
```
Context Guard Status:
  ✓ Hooks installed (2/2 scripts in .claude/hooks/)
  ✓ Settings configured (PostToolUse entries in .claude/settings.json)
  ✓ Quality rule active (.claude/rules/context-quality.md)

Drift check:
  ✓ CLAUDE.md — up to date
  ⚠ AGENTS.md — 12 source commits since last update
  ✓ .cursorrules — up to date
  · GEMINI.md — not present
```
