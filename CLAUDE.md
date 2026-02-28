# PitchDocs

Generate high-quality public-facing repository documentation with a marketing edge. PitchDocs is a Claude Code plugin (pure Markdown, zero runtime dependencies) with 13 skills, 1 orchestration agent, 1 quality rule, and 11 slash commands.

## Project Architecture

This is a **100% Markdown-based plugin** — no JavaScript, no Python, no build step. All knowledge lives in structured YAML+Markdown files:

```
.claude-plugin/plugin.json     → Plugin manifest (name, version, keywords)
.claude/skills/*/SKILL.md      → 13 reference knowledge modules (loaded on-demand)
.claude/agents/docs-writer.md  → Orchestration agent (codebase scan → feature extract → write → validate)
.claude/rules/doc-standards.md → Quality standards (auto-loaded every session)
commands/*.md                  → 11 slash command definitions
```

## Conventions

- **Australian English**: realise, colour, behaviour, licence (noun), license (verb)
- **Conventional Commits**: `feat:`, `fix:`, `docs:`, `chore:` — release-please automates versioning
- **Benefit-driven language**: Every feature claim traces to actual code. Pattern: `[Feature] so you can [outcome] — [evidence]`
- **4-question test**: Every generated doc must answer: Does this solve my problem? Can I use it? Who made it? Where do I learn more?
- **Progressive disclosure**: Non-technical first paragraph, technical details deeper

## Key Files

| File | Purpose |
|------|---------|
| `plugin.json` | Version, description, keywords — update on every release |
| `doc-standards.md` | Quality rule auto-loaded in every session — the source of truth for formatting, GEO, badges, and visual structure |
| `docs-writer.md` | Agent workflow: 4 steps (discover → extract → write → validate) with content filter mitigations |
| `upstream-versions.json` | Tracks 7 pinned spec versions — checked monthly by GitHub Action |
| `llms.txt` | AI-readable content index — must be updated when files are added/removed |
| `AGENTS.md` | Cross-tool AI context (Codex CLI format) — must stay in sync with skills/commands |

## When Modifying This Plugin

1. **Adding a skill**: Create `.claude/skills/<name>/SKILL.md`, add a corresponding command in `commands/<name>.md`, update the skills table in `README.md`, `AGENTS.md`, and `llms.txt`
2. **Adding a command**: Create `commands/<name>.md` with YAML frontmatter, update commands tables in `README.md`, `AGENTS.md`, and `llms.txt`
3. **Changing quality standards**: Edit `.claude/rules/doc-standards.md` — this propagates to all generated docs automatically
4. **Updating upstream specs**: Edit `upstream-versions.json` and the corresponding skill content
5. **Bumping version**: Handled automatically by release-please from conventional commit messages
