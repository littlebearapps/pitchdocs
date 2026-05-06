# PitchDocs — Copilot Instructions

PitchDocs is a Claude Code plugin that generates marketing-quality repository documentation. Pure Markdown, no runtime dependencies.

## Project Structure

- `.claude/skills/*/SKILL.md` — 15 reference knowledge modules (public-readme, features, changelog, roadmap, pitchdocs-suite, llms-txt, package-registry, user-guides, docs-verify, launch-artifacts, api-reference, doc-refresh, visual-standards, geo-optimisation, platform-profiles). Follows the [Agent Skills](https://agentskills.io) open standard. 6 skills (`changelog`, `roadmap`, `visual-standards`, `docs-verify`, `doc-refresh`, `llms-txt`) are user-invocable as slash commands per Claude Code's skill/command merge.
- `.claude/agents/*.md` — 3 pipeline agents (docs-writer orchestrator, docs-researcher, docs-reviewer)
- `.claude/rules/content-filter.md` — 1 globally auto-loaded rule (Claude Code only); `.claude/rules/doc-standards.md`, `.claude/rules/docs-awareness.md` — 2 installed auto-loaded rules
- `rules/doc-standards.md` — quality standards (installed per-project by `/pitchdocs:activate`)
- `rules/docs-awareness.md` — documentation trigger map (installed per-project by `/pitchdocs:activate`)
- `agents/docs-freshness.md` — freshness checker agent (installed per-project by `/pitchdocs:activate`)
- `commands/*.md` — 10 command definitions (8 active + 2 stubs redirecting to ContextDocs); 14 user-invocable slash commands in total (8 from `commands/` + 6 from skills).
- `hooks/content-filter-guard.sh` — 1 opt-in hook (installed per-project by `/pitchdocs:activate install strict`, Claude Code only)
- `.claude-plugin/plugin.json` — plugin manifest

## Conventions

- Australian English spelling (realise, colour, behaviour, licence)
- Conventional Commits for git messages (feat:, fix:, docs:, chore:)
- Benefit-driven documentation: every feature claim traces to code evidence (with optional JTBD job mapping for richer benefits)
- 4-question framework: Does this solve my problem? Can I use it? Who made it? Where do I learn more?
- GEO-optimised structure for AI citation (crisp definitions, atomic sections, comparison tables)

## Sync Points

When modifying skills or commands, keep these files in sync: README.md, AGENTS.md, llms.txt, and the bug report template component dropdown.

## Protected Files

`docs/faq/index.md` is load-bearing — it sources the marketing-site `FAQPage` JSON-LD on `https://littlebearapps.com/help/pitchdocs/`. The docs-sync pipeline (`scripts/docs-sync.config.ts` in `littlebearapps/littlebearapps.com`, mapped under `pitchdocs` with `category: faq`) hard-fails if the directory is missing. Keep ≥7 question-shaped H2 headings (`##`); edit entries in place; never delete. See [Protected Documentation Files](../AGENTS.md#protected-documentation-files) in `AGENTS.md`.
