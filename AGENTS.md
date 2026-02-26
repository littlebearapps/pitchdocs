# PitchDocs

Generate high-quality public-facing repository documentation with a marketing edge. PitchDocs creates READMEs that sell, changelogs that communicate value, roadmaps from GitHub milestones, and audits your docs completeness.

## Documentation Standards

Every document must answer these questions for the reader:

1. **Does this solve my problem?** — Clear problem statement and value proposition in the first paragraph
2. **Can I use it?** — Installation, prerequisites, and quickstart within 30 seconds of reading
3. **Who made it?** — Credibility signals: author, contributors, badges, community size
4. **Where do I learn more?** — Links to docs, examples, community, and support channels

Write in **benefit-driven language** — describe what users gain, not just what the software does. Use progressive disclosure: non-technical first paragraph, technical details deeper. Active voice. Short sentences. Reader-centric framing ("You can now..." not "We implemented...").

Every feature mentioned must translate into a user benefit using this pattern:

```
[Technical feature] so you can [user outcome] — [evidence]
```

## Available Skills

Skills are loaded on-demand to provide deep reference knowledge. Each lives at `.claude/skills/<name>/SKILL.md` (or `.agents/skills/<name>/SKILL.md` if you've copied them for Codex CLI).

| Skill | What It Provides |
|-------|-----------------|
| `public-readme` | README structure with the Daytona/Banesullivan marketing framework — hero section, why section, quickstart, features table with evidence-based benefits |
| `feature-benefits` | 5-step codebase scanning workflow across 10 signal categories. Extracts concrete features with file/function evidence and translates them into benefits across 5 categories (time saved, confidence gained, pain avoided, capability unlocked, cost reduced) |
| `changelog` | Keep a Changelog format with language rules that rewrite conventional commits into user-facing benefit language. Maps `feat:` to Added, `fix:` to Fixed, etc. |
| `roadmap` | Roadmap structure from GitHub milestones with emoji status indicators, mission statement, and community involvement section |
| `pitchdocs-suite` | Full 17+ file inventory (README, CONTRIBUTING, CHANGELOG, CODE_OF_CONDUCT, SECURITY, issue templates, PR templates, and more), GitHub metadata guidance, visual assets, licence selection framework, and ready-to-use templates |
| `llms-txt` | llmstxt.org specification reference for generating `llms.txt` and `llms-full.txt` — LLM-friendly content indices for AI coding assistants |
| `package-registry` | npm and PyPI metadata field auditing, cross-renderer README compatibility (GitHub vs npm vs PyPI), trusted publishing guidance, and registry-specific badges |
| `user-guides` | Task-oriented how-to documentation structure with numbered steps, prerequisites, verification, and cross-linked hub pages |

## Docs-Writer Agent

The docs-writer agent (`.claude/agents/docs-writer.md`) orchestrates the full documentation workflow:

1. **Codebase discovery** — reads manifest files, scans project structure, checks git history and GitHub metadata
2. **Feature extraction** — loads the `feature-benefits` skill and runs a 5-step extraction across 10 signal categories
3. **Writing with marketing framework** — applies the Daytona "4000 Stars" approach with progressive disclosure
4. **Validation** — checks the 4-question test, verifies links, badges, spelling, and cross-renderer compatibility

## Workflow Commands

These commands are defined in `commands/*.md` and can be invoked as slash commands in Claude Code and OpenCode, or as prompts in Codex CLI:

| Command | What It Does |
|---------|-------------|
| `readme` | Generate or update a marketing-friendly README.md |
| `features` | Extract features from code and translate to benefits |
| `changelog` | Generate CHANGELOG.md from git history with user-benefit language |
| `roadmap` | Generate ROADMAP.md from GitHub milestones and issues |
| `docs-audit` | Audit docs completeness, quality, GitHub metadata, and registry config |
| `llms-txt` | Generate llms.txt and llms-full.txt for AI discoverability |
| `user-guide` | Generate task-oriented user guides in `docs/guides/` |
