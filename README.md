<div align="center">

# PitchDocs

**GitHub repository documentation skills and templates for AI coding assistants.**

Give your AI the knowledge to map out any codebase, extract a features-and-benefits summary, then create, enhance, and maintain professional public-facing GitHub repository docs — SEO and GEO ready with llms.txt (including external documentation sites), and npm/PyPI registry compatible.

A plugin for [Claude Code](https://code.claude.com/) and [OpenCode](https://opencode.ai/) — also works with [Codex CLI](https://codex.openai.com/), [Cursor](https://cursor.com/), [Gemini CLI](https://github.com/google-gemini/gemini-cli), and more.

[![Version](https://img.shields.io/static/v1?label=version&message=1.4.0&color=blue)](CHANGELOG.md) <!-- x-release-please-version -->
[![License](https://img.shields.io/github/license/littlebearapps/pitchdocs)](LICENSE)
[![Claude Code Plugin](https://img.shields.io/badge/Claude_Code-Plugin-D97757?logo=claude&logoColor=white)](https://code.claude.com/docs/en/plugins)
[![OpenCode Compatible](https://img.shields.io/badge/OpenCode-Compatible-22c55e)](https://opencode.ai/)
[![npm & PyPI Ready](https://img.shields.io/badge/npm_%26_PyPI-Ready-cb3837)](https://www.npmjs.com/)

[Get Started](#-get-started) · [Features](#-features) · [Commands](#-commands) · [Skills](#-skills) · [Other AI Tools](#-use-with-other-ai-tools) · [Contributing](CONTRIBUTING.md)

</div>

---

## ⚡ Get Started

### Claude Code / OpenCode

```bash
# 1. Add the LBA plugin marketplace (once)
/plugin marketplace add littlebearapps/lba-plugins

# 2. Install PitchDocs
/plugin install pitchdocs@lba-plugins

# 3. Generate a README for any project
/readme
```

OpenCode reads `.claude/skills/` natively — the same install steps work in both tools.

**Using Codex CLI, Cursor, Gemini CLI, Aider, or Goose?** See [Use with Other AI Tools](#-use-with-other-ai-tools) for setup instructions.

---

## 🚀 What PitchDocs Does

### Ship a professional README

You've finished your MVP. The repo is about to go public. You need a README that does more than list install commands — it needs to **sell** the project to potential users, contributors, and sponsors.

PitchDocs scans your codebase, extracts features with file-level evidence, translates them into benefit-driven language, and generates a marketing-friendly README with a hero section, a "why" narrative, a features-and-benefits table, a working quick start, and proper badges. Run `/readme` and get a README that passes the [4-question test](#-why-pitchdocs).

### Generate the full docs suite

Beyond the README, a professional open-source repo needs **CHANGELOG**, **CONTRIBUTING**, **ROADMAP**, **CODE_OF_CONDUCT**, **SECURITY**, issue templates, PR templates, release config, and more. Writing all of these by hand is tedious and error-prone.

Run `/docs-audit fix` to scan your repo against a 17+ file checklist and auto-generate everything that's missing — or use individual commands (`/changelog`, `/roadmap`, `/user-guide`) for just the docs you need.

### Make your project discoverable

Great docs are useless if nobody can find them. PitchDocs handles the discovery layer:

- **`llms.txt`** — generate AI-readable content indices following the [llmstxt.org](https://llmstxt.org/) spec, so AI coding assistants and search engines surface your docs (SEO and GEO)
- **npm / PyPI metadata** — audit your `package.json` and `pyproject.toml` for missing fields that affect your registry page (description, keywords, repository, homepage, types)
- **Cross-renderer compatibility** — ensure your README renders correctly on GitHub, npm, and PyPI, not just one platform
- **Upstream spec drift detection** — a GitHub Action checks monthly that your CHANGELOG, CODE_OF_CONDUCT, and commit conventions follow the latest spec versions

---

## 💡 Why PitchDocs?

Most documentation generators produce technically-accurate but dry output. Nobody reads it, nobody gets excited, nobody stars the repo.

PitchDocs generates documentation with a **marketing edge** — docs that answer the reader's real questions:

| Question | How PitchDocs Answers It |
|----------|-------------------------|
| Does this solve my problem? | Benefit-driven feature descriptions, not just specs |
| Can I use it? | Quick start that works in under 5 minutes |
| Who made it? | Badges, contributor counts, credibility signals |
| Where do I learn more? | Cross-linked guides, hub pages, community links |

Every doc follows **progressive disclosure** — non-technical first paragraph, technical details deeper — and every doc **cross-links** to related docs so readers never hit a dead end.

---

## 🎯 Features

- **Evidence-based feature extraction** — scans 10 signal categories in your codebase and surfaces selling points automatically, with every feature traced to actual code
- **4-question framework on every doc** — validates that your docs answer "Does this solve my problem?", "Can I use it?", "Who made it?", and "Where do I learn more?"
- **17+ file documentation audit** — never ship a repo with missing docs, broken metadata, or invisible image links
- **7 slash commands** — generate any doc type from your terminal in under a minute, from README to llms.txt
- **Ready-to-use templates** — CONTRIBUTING, CODE_OF_CONDUCT, SECURITY, SUPPORT, issue templates, PR templates, and release config — one plugin replaces writing 10+ files by hand
- **llms.txt generation** — create AI-readable content indices following the [llmstxt.org](https://llmstxt.org/) spec so coding assistants and search engines surface your docs
- **Licence selection and visual assets** — choose the right licence and present your project with compelling visuals
- **npm and PyPI compatibility** — audit registry metadata and ensure your README renders correctly on GitHub, npm, and PyPI
- **Progressive disclosure** — docs open with non-technical language and reveal technical depth as readers scroll, with automatic cross-linking between sections
- **Upstream spec drift detection** — a GitHub Action checks monthly that your CHANGELOG, CODE_OF_CONDUCT, and commit conventions follow the latest spec versions

---

## 🤖 Commands

| Command | What It Does | Why It Matters |
|---------|-------------|----------------|
| `/readme` | Generate or update a marketing-friendly README.md | First impressions that convert browsers to users |
| `/features` | Extract features from code and translate to benefits | Never miss a feature worth documenting |
| `/changelog` | Generate CHANGELOG.md from git history with user-benefit language | Users see what changed for *them*, not your commit log |
| `/roadmap` | Generate ROADMAP.md from GitHub milestones and issues | Show contributors where the project is heading |
| `/docs-audit` | Audit docs completeness, quality, GitHub metadata, visual assets, and npm/PyPI registry config | Catch gaps in files, metadata, images, and package registry fields before you ship |
| `/llms-txt` | Generate llms.txt and llms-full.txt for AI discoverability | AI coding assistants and search engines find and understand your docs |
| `/user-guide` | Generate task-oriented user guides in `docs/guides/` | Readers find answers without reading your source code |

The **docs-writer** agent powers these commands — it scans your codebase, extracts features with evidence, and writes docs that pass the 4-question test.

### Quick Examples

```bash
# Generate a README for the current project
/readme

# Extract features from code and output a benefits table
/features table

# Audit features: what's documented vs what's in the code
/features audit

# Generate the full changelog from all tags
/changelog full

# Audit what docs are missing and auto-generate them
/docs-audit fix

# Generate llms.txt for AI tool discoverability
/llms-txt

# Generate both llms.txt and llms-full.txt
/llms-txt full

# Generate a getting-started user guide
/user-guide getting-started
```

---

## 📚 Skills

Skills are loaded on-demand to provide deep reference knowledge:

| Skill | What You Get |
|-------|-------------|
| `public-readme` | README structure with the Daytona/Banesullivan marketing framework — hero, why, quickstart, features with benefits |
| `feature-benefits` | 5-step codebase scanning workflow across 10 signal categories with evidence-based benefit translation |
| `changelog` | Keep a Changelog format with language rules that rewrite commits into user-facing benefit language |
| `roadmap` | Roadmap structure from GitHub milestones with emoji status indicators and community involvement section |
| `pitchdocs-suite` | 17+ file inventory, GitHub metadata, visual assets guidance, licence selection framework, and ready-to-use templates |
| `llms-txt` | llmstxt.org specification reference with generation patterns for repos and docs sites |
| `package-registry` | npm and PyPI metadata field inventories, README cross-renderer compatibility, trusted publishing guidance, and registry badges |
| `user-guides` | Task-oriented how-to documentation with numbered steps, verification, and cross-linked hub pages |

---

## 🔀 Use with Other AI Tools

PitchDocs is built as a Claude Code plugin, but the documentation knowledge it contains — skills, agent workflows, quality standards — is stored as plain Markdown files with YAML frontmatter. That makes it portable to other AI coding tools with minimal effort.

The source of truth lives in `.claude/`. Here's what's inside and what each piece does:

| Directory | Contents | Purpose |
|-----------|----------|---------|
| `.claude/skills/*/SKILL.md` | 8 skill files | Reference knowledge for README generation, feature extraction, changelogs, roadmaps, user guides, llms.txt, package registry auditing, and full docs suite inventory |
| `.claude/agents/docs-writer.md` | 1 agent file | Orchestration workflow: codebase scanning → feature extraction → doc writing → validation |
| `.claude/rules/doc-standards.md` | 1 rule file | Quality standards: 4-question framework, progressive disclosure, benefit-driven language, visual formatting |
| `commands/*.md` | 7 command files | Slash command definitions for `/readme`, `/changelog`, `/roadmap`, `/docs-audit`, `/features`, `/llms-txt`, `/user-guide` |

### OpenCode

[OpenCode](https://opencode.ai/) reads `.claude/skills/` natively — PitchDocs works out of the box with no extra setup.

**Install** the same way as Claude Code (clone or add as a plugin), then invoke skills by name in your OpenCode session. The 8 SKILL.md files, the docs-writer agent, and the doc-standards rule are all picked up automatically.

OpenCode also supports MCP servers, so if you have the GitHub MCP server configured, the docs-writer agent can access repository metadata, issues, and releases just as it does in Claude Code.

### Codex CLI

[Codex CLI](https://codex.openai.com/) (OpenAI) uses the same SKILL.md format as Claude Code but looks for skills at a different path: `.agents/skills/` instead of `.claude/skills/`.

**Step 1 — Copy skills into your project:**

```bash
# From your project root (not the PitchDocs repo)
PITCHDOCS="/path/to/pitchdocs"

# Copy all 8 skills
cp -r "$PITCHDOCS/.claude/skills/"* .agents/skills/

# Copy the quality standards as AGENTS.md (Codex reads this automatically)
cp "$PITCHDOCS/AGENTS.md" ./AGENTS.md
```

**Step 2 — Use the skills:**

Codex CLI loads SKILL.md files automatically when they're in `.agents/skills/`. Ask it to generate documentation and it will have access to the PitchDocs frameworks:

```
> Generate a marketing-friendly README for this project using the public-readme skill
> Extract features and benefits from this codebase using the feature-benefits skill
```

**Step 3 (optional) — Add slash commands:**

Copy PitchDocs command files into your Codex prompts directory to get `/prompts:readme`, `/prompts:changelog`, etc.:

```bash
cp "$PITCHDOCS/commands/"*.md ~/.codex/prompts/pitchdocs/
```

### Cursor

[Cursor](https://cursor.com/) uses `.cursor/rules/*.mdc` files for contextual rules and `.cursor/agents/*.md` for subagents. It doesn't read SKILL.md files, but you can adapt PitchDocs content to Cursor's format.

**Step 1 — Add the documentation standards as a Cursor rule:**

Create `.cursor/rules/doc-standards.mdc` in your project:

```
---
description: PitchDocs documentation quality standards — 4-question framework, benefit-driven language, progressive disclosure, marketing-friendly structure
---

(Paste the contents of .claude/rules/doc-standards.md here, without its YAML frontmatter)
```

Because this rule has a `description` but no `globs` or `alwaysApply`, Cursor treats it as an **agent-selected rule** — it gets included automatically when the AI determines it's relevant to your request.

**Step 2 — Add the docs-writer agent:**

Create `.cursor/agents/docs-writer.md` in your project:

```
---
name: docs-writer
description: Generates high-quality public-facing repository documentation with marketing appeal
---

(Paste the contents of .claude/agents/docs-writer.md here, without its YAML frontmatter)
```

**Step 3 — Reference skills on demand:**

Cursor doesn't have a skills directory, but you can reference PitchDocs skill files directly. Clone the PitchDocs repo somewhere accessible, then ask Cursor:

```
> Read the file at /path/to/pitchdocs/.claude/skills/public-readme/SKILL.md and use it to generate a README for this project
```

Or paste specific skill content into additional `.cursor/rules/*.mdc` files for the skills you use most often.

### Gemini CLI

[Gemini CLI](https://github.com/google-gemini/gemini-cli) uses `GEMINI.md` for project context and `.gemini/commands/*.toml` for custom commands. It doesn't read SKILL.md files directly, but the knowledge transfers easily.

**Option A — Quick setup (context file):**

Copy the documentation standards into your project's Gemini context:

```bash
# Create .gemini/ directory
mkdir -p .gemini

# Use the doc-standards rule as your base context
cp /path/to/pitchdocs/.claude/rules/doc-standards.md .gemini/GEMINI.md
```

Then ask Gemini to read specific skill files when needed:

```
> Read /path/to/pitchdocs/.claude/skills/public-readme/SKILL.md and use it to generate a README
```

**Option B — Custom commands (TOML):**

For frequently used workflows, create TOML command files. For example, `.gemini/commands/readme.toml`:

```toml
description = "Generate a marketing-friendly README using PitchDocs standards"
prompt = """
Read the PitchDocs public-readme skill at /path/to/pitchdocs/.claude/skills/public-readme/SKILL.md
and the feature-benefits skill at /path/to/pitchdocs/.claude/skills/feature-benefits/SKILL.md.

Then analyse this codebase and generate a README.md following the skill instructions.
Use the 4-question framework, progressive disclosure, and benefit-driven language.
"""
```

This gives you a `/readme` command in Gemini CLI.

### Aider

[Aider](https://aider.chat/) doesn't have a plugin or skill system, but it can load reference files into its context via the `read` config option.

**Add to `.aider.conf.yml` in your project:**

```yaml
read:
  - /path/to/pitchdocs/.claude/rules/doc-standards.md
```

This loads the documentation quality standards into every Aider session. For specific tasks, load skill files directly in chat:

```
/read /path/to/pitchdocs/.claude/skills/public-readme/SKILL.md
Generate a README for this project following the skill instructions.
```

### Goose

[Goose](https://github.com/block/goose) (by Block) uses `.goosehints` for project context and MCP servers for tool access.

**Add PitchDocs context to `.goosehints`:**

```bash
# Append the doc-standards rule to your project hints
cat /path/to/pitchdocs/.claude/rules/doc-standards.md >> .goosehints
```

For specific documentation tasks, reference skill files in your Goose session. If you have the GitHub MCP server configured, Goose can access repository metadata just as Claude Code does.

---

## 🔌 Upstream Specifications

This plugin references several third-party specifications. Pinned versions are tracked in [`upstream-versions.json`](upstream-versions.json) and checked monthly via [GitHub Actions](.github/workflows/check-upstream.yml):

| Specification | Pinned Version | Status |
|---------------|---------------|--------|
| [Keep a Changelog](https://keepachangelog.com/) | 1.1.1 | Frozen |
| [Contributor Covenant](https://www.contributor-covenant.org/) | 3.0 | Slow (every 3-4 years) |
| [Conventional Commits](https://www.conventionalcommits.org/) | 1.0.0 | Frozen |
| [Semantic Versioning](https://semver.org/) | 2.0.0 | Frozen |

---

## 🤝 Contributing

Found a way to make generated docs even better? We'd love your help — whether it's improving a template, fixing a language rule, or suggesting a new doc type entirely.

See our [Contributing Guide](CONTRIBUTING.md) to get started, or jump straight in:

- [Good First Issues](https://github.com/littlebearapps/pitchdocs/labels/good%20first%20issue) — Great starting points
- [Feature Requests](https://github.com/littlebearapps/pitchdocs/issues/new?template=feature_request.yml) — Suggest improvements
- [Open Issues](https://github.com/littlebearapps/pitchdocs/issues) — See what needs doing

> [!NOTE]
> **Claude Code content filter:** When generating `CODE_OF_CONDUCT.md`, `SECURITY.md`, or `LICENSE` files, Claude Code's API may return HTTP 400 due to its server-side content filtering policy. This is a [known upstream issue](https://github.com/anthropics/claude-code/issues/2111) that Anthropic considers [expected behaviour](https://github.com/anthropics/claude-code/issues/6195). PitchDocs includes built-in workarounds — the plugin fetches these files from canonical URLs rather than generating them inline. See the `docs-writer` agent's Content Filter Mitigation section for details.

---

## 📄 Licence

[MIT](LICENSE) — Made by [Little Bear Apps](https://littlebearapps.com) 🐶
