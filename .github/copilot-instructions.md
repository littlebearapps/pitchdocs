# PitchDocs — Copilot Instructions

PitchDocs is a Claude Code plugin that generates marketing-quality repository documentation. Pure Markdown, no runtime dependencies.

## Project Structure

- `.claude/skills/*/SKILL.md` — 16 reference knowledge modules (README, features, changelog, roadmap, docs suite, llms.txt, package registry, user guides, docs verify, launch artifacts, API reference, doc refresh, visual standards, GEO optimisation, skill authoring, platform profiles)
- `.claude/agents/*.md` — 3 agents (docs-writer orchestrator, docs-researcher, docs-reviewer)
- `.claude/rules/doc-standards.md` — quality standards rule (auto-loaded, Claude Code only)
- `.claude/rules/content-filter.md` — content filter quick reference rule (auto-loaded, Claude Code only)
- `.claude/rules/docs-awareness.md` — documentation trigger map (auto-loaded, Claude Code only)
- `commands/*.md` — 15 command definitions (13 active + 2 stubs redirecting to ContextDocs)
- `hooks/content-filter-guard.sh` — content filter write guard (Claude Code only, opt-in)
- `.claude-plugin/plugin.json` — plugin manifest

## Conventions

- Australian English spelling (realise, colour, behaviour, licence)
- Conventional Commits for git messages (feat:, fix:, docs:, chore:)
- Benefit-driven documentation: every feature claim traces to code evidence (with optional JTBD job mapping for richer benefits)
- 4-question framework: Does this solve my problem? Can I use it? Who made it? Where do I learn more?
- GEO-optimised structure for AI citation (crisp definitions, atomic sections, comparison tables)

## Sync Points

When modifying skills or commands, keep these files in sync: README.md, AGENTS.md, llms.txt, and the bug report template component dropdown.
