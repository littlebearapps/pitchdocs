# PitchDocs

A Claude Code plugin that generates marketing-quality repository documentation — READMEs, changelogs, and 15+ more doc types for any codebase. For AI context file management, see [ContextDocs](https://github.com/littlebearapps/contextdocs).

## Tech Stack

Markdown, YAML frontmatter, Claude Code plugin system

## Commands

No build, test, or deploy commands — this is a pure Markdown plugin. Lint with `npx markdownlint-cli2 "**/*.md"`.

## Conventions

- Australian English (realise, colour, behaviour, licence/license)
- Conventional Commits (feat:, fix:, docs:, chore:)
- Benefit-driven language: every feature claim traces to code evidence
- 4-question test: problem solved? usable? credible? linked?
- GEO-optimised structure for AI citation

## Key Paths

- `.claude/skills/*/SKILL.md`: 16 reference knowledge modules
- `.claude/agents/*.md`: 3 agents (docs-writer, docs-researcher, docs-reviewer)
- `.claude/rules/*.md`: 3 rules (doc-standards, content-filter, docs-awareness)
- `commands/*.md`: 15 command definitions (13 active + 2 stubs)
- `hooks/content-filter-guard.sh`: content filter write guard (Claude Code only, opt-in)
- `.claude-plugin/plugin.json`: plugin manifest
- `upstream-versions.json`: pinned upstream spec versions
