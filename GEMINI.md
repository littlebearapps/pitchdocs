# PitchDocs

A Claude Code plugin that generates marketing-quality repository documentation — READMEs, changelogs, AI context files, and 15+ more doc types for any codebase.

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

- `.claude/skills/*/SKILL.md`: 15 reference knowledge modules
- `.claude/agents/docs-writer.md`: orchestration agent
- `.claude/rules/doc-standards.md`: quality standards (Claude Code only)
- `commands/*.md`: 13 slash command definitions
- `hooks/*.sh`: 3 Context Guard hooks (Claude Code only, opt-in)
- `.claude-plugin/plugin.json`: plugin manifest
- `upstream-versions.json`: pinned upstream spec versions
