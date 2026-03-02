---
name: context-guard
description: Installs opt-in Claude Code hooks that detect stale AI context files (CLAUDE.md, AGENTS.md, GEMINI.md, etc.), remind developers to update them, and prevent content filter errors when generating standard OSS files. Includes post-commit drift detection, structural change reminders, content filter write guards, and a quality rule. Claude Code only — hooks do not work in OpenCode, Codex CLI, or other tools.
version: "1.0.0"
---

# Context Guard

## What It Does

Context Guard adds two PostToolUse hooks, one PreToolUse hook, and one quality rule to a project. The PostToolUse hooks detect when AI context files (CLAUDE.md, AGENTS.md, GEMINI.md, .cursorrules, copilot-instructions.md, .windsurfrules, .clinerules) are out of date and nudge the developer to update them. The PreToolUse hook prevents content filter errors by intercepting Write operations on files known to trigger Claude Code's API content filter.

**Claude Code only.** These hooks use Claude Code's hook system (PostToolUse events, `.claude/settings.json` configuration). OpenCode, Codex CLI, Cursor, Windsurf, Cline, and Gemini CLI do not support Claude Code hooks. The quality rule (`.claude/rules/context-quality.md`) is also Claude Code-specific.

Cross-tool features like skills (`.claude/skills/`) and AGENTS.md work in OpenCode and Codex CLI without Context Guard.

## Components

### Hook: context-drift-check.sh

- **Event:** PostToolUse on `Bash` (filters for `git commit` commands)
- **Fires:** After a successful git commit
- **Checks:**
  1. Compares each context file's last-modified commit vs the most recent source-code commit
  2. Detects broken file-path references inside context files
  3. Flags when `package.json` or `pyproject.toml` changed more recently than context files
- **Output:** Lists stale files and recommends `/ai-context audit`, or stays silent if everything is current
- **Throttle:** Max once per hour via `.git/.context-guard-last-check` timestamp

### Hook: context-structural-change.sh

- **Event:** PostToolUse on `Write|Edit`
- **Fires:** After creating or editing structural files (commands, skills, agents, rules, manifests, config)
- **Reminds:** Which context files may need updating based on the type of change
- **File patterns:**
  - `commands/*.md` → AGENTS.md, CLAUDE.md, llms.txt
  - `.claude/skills/*/SKILL.md` → AGENTS.md, CLAUDE.md, llms.txt
  - `.claude/agents/*.md` → AGENTS.md
  - `.claude/rules/*.md` → CLAUDE.md, AGENTS.md
  - `package.json`, `pyproject.toml`, config files → all context files

### Hook: content-filter-guard.sh

- **Event:** PreToolUse on `Write`
- **Fires:** Before Claude Code writes a file
- **HIGH-risk files** (CODE_OF_CONDUCT.md, LICENSE, SECURITY.md):
  - Blocks the write (exit non-zero)
  - Returns fetch commands for the canonical URL
- **MEDIUM-risk files** (CHANGELOG.md, CONTRIBUTING.md):
  - Allows the write
  - Returns advisory about chunked writing (5–10 entries at a time)
- **All other files:** Passes through silently

### Rule: context-quality.md

Auto-loaded every session. Establishes cross-file consistency, path verification, version accuracy, command accuracy, and a sync-points table mapping project changes to context files.

## Installation

The `/context-guard install` command:

1. Copies hook scripts to `.claude/hooks/` in the target project
2. Merges hook configuration into `.claude/settings.json`
3. Copies the quality rule to `.claude/rules/context-quality.md`
4. Makes hook scripts executable

### Settings.json Configuration

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Write",
        "hooks": [{
          "type": "command",
          "command": ".claude/hooks/content-filter-guard.sh"
        }]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Bash",
        "hooks": [{
          "type": "command",
          "command": ".claude/hooks/context-drift-check.sh"
        }]
      },
      {
        "matcher": "Write|Edit",
        "hooks": [{
          "type": "command",
          "command": ".claude/hooks/context-structural-change.sh"
        }]
      }
    ]
  }
}
```

## Uninstallation

The `/context-guard uninstall` command removes all hook scripts (context-drift-check.sh, context-structural-change.sh, content-filter-guard.sh), settings.json entries, and the quality rule.

## Customisation

### Throttle Interval

Edit `context-drift-check.sh` line with `3600` (seconds) to change the check interval. Set to `0` to check on every commit.

### File Patterns

Edit `context-structural-change.sh` case statement to add or remove structural file patterns.

## Troubleshooting

| Issue | Cause | Fix |
|-------|-------|-----|
| Hooks not firing | Scripts not executable | `chmod +x .claude/hooks/*.sh` |
| No output after commit | Throttle active | Delete `.git/.context-guard-last-check` to reset |
| "jq: command not found" | jq not installed | Install jq: `apt install jq` or `brew install jq` |
| Hooks fail silently | jq receives malformed JSON | Run `.claude/hooks/context-drift-check.sh` manually and check for JSON parse errors — common when `settings.json` has trailing commas or comments |
| Hook errors in logs | Wrong project directory | Check `CLAUDE_PROJECT_DIR` is set correctly |
| Hook blocks legitimate writes | content-filter-guard too aggressive | Uninstall with `/context-guard uninstall`, or remove just the PreToolUse entry from `.claude/settings.json` |
