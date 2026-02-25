<div align="center">

# PitchDocs

**Pitch-perfect documentation for every repository.**

A [Claude Code](https://code.claude.com/) plugin — install it, run a command, get docs that pass the 4-question test.

[![Version](https://img.shields.io/badge/version-1.4.0)](CHANGELOG.md) <!-- x-release-please-version -->
[![License](https://img.shields.io/github/license/littlebearapps/pitchdocs)](LICENSE)
[![Claude Code Plugin](https://img.shields.io/badge/Claude_Code-Plugin-D97757?logo=claude&logoColor=white)](https://code.claude.com/docs/en/plugins)

[Get Started](#get-started) · [Features](#features) · [Commands](#commands) · [Skills](#skills) · [Contributing](CONTRIBUTING.md)

</div>

---

> Run `/readme` on any repo. Here's what changes:

### Before

```markdown
# my-project
Install: npm install my-project
Usage: import thing from 'my-project'
License: MIT
```

### After

```markdown
# my-project
Ship production-ready APIs in minutes — type-safe, observable, cost-aware.

[Badges] [Quick links]

## Why my-project?
| Problem | Solution |
| Manual config is error-prone | Zero-config defaults with full override support |

## Features
| Feature | Benefit |
| Automatic retry with backoff | Recover from transient failures without writing retry logic |
| OpenTelemetry tracing built in | Know exactly where requests slow down — traces attached to every handler |

## Quick Start · Contributing · License
```

> Run `/features table` to extract those features directly from your codebase — every benefit traces to actual code.

---

## Why PitchDocs?

Most documentation generators produce technically-accurate but dry output. Nobody reads it, nobody gets excited, nobody stars the repo.

PitchDocs generates documentation with a **marketing edge** — docs that answer the reader's real questions:

| Question | How PitchDocs Answers It |
|----------|-------------------------|
| Does this solve my problem? | Benefit-driven feature descriptions, not just specs |
| Can I use it? | Quick start that works in under 5 minutes |
| Who made it? | Badges, contributor counts, credibility signals |
| Where do I learn more? | Cross-linked guides, hub pages, community links |

Every doc follows **progressive disclosure** — non-technical first paragraph, technical details deeper — and every doc **cross-links** to related docs so readers never hit a dead end.

## Get Started

```bash
# 1. Add the LBA plugin marketplace (once)
/plugin marketplace add littlebearapps/lba-plugins

# 2. Install PitchDocs
/plugin install pitchdocs@lba-plugins

# 3. Generate a README for any project
/readme
```

## Features

| Feature | Benefit |
|---------|---------|
| Evidence-based feature extraction — scans 10 signal categories | Scan any codebase and surface its selling points automatically |
| Daytona/Banesullivan 4-question framework on every doc | Know your docs answer real reader questions, not just list API methods |
| Documentation audit — 17+ file types, GitHub metadata, and visual assets | Never ship a repo with missing docs, invisible metadata, or broken image links |
| 7 slash commands covering README to llms.txt | Generate any doc type from your terminal in under a minute |
| Templates for CONTRIBUTING, CODE_OF_CONDUCT, SECURITY, SUPPORT, issues, PRs, release config | One plugin replaces writing 10+ boilerplate files by hand |
| llms.txt generation following the llmstxt.org specification | Make your docs discoverable by AI coding assistants and search engines |
| LICENSE selection framework and visual assets guidance | Choose the right licence and present your project with compelling visuals |
| npm and PyPI package registry metadata auditing and cross-renderer README compatibility | Know your README renders correctly on GitHub, npm, and PyPI — and your package page has complete metadata |
| Progressive disclosure and automatic cross-linking | Readers find what they need without scrolling past jargon |
| Upstream spec drift detection via GitHub Actions | Stay current with Keep a Changelog, Contributor Covenant, and Semantic Versioning |

## Commands

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

## Skills

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

## Upstream Specifications

This plugin references several third-party specifications. Pinned versions are tracked in [`upstream-versions.json`](upstream-versions.json) and checked monthly via [GitHub Actions](.github/workflows/check-upstream.yml):

| Specification | Pinned Version | Status |
|---------------|---------------|--------|
| [Keep a Changelog](https://keepachangelog.com/) | 1.1.1 | Frozen |
| [Contributor Covenant](https://www.contributor-covenant.org/) | 3.0 | Slow (every 3-4 years) |
| [Conventional Commits](https://www.conventionalcommits.org/) | 1.0.0 | Frozen |
| [Semantic Versioning](https://semver.org/) | 2.0.0 | Frozen |

## Contributing

Found a way to make generated docs even better? We'd love your help — whether it's improving a template, fixing a language rule, or suggesting a new doc type entirely.

See our [Contributing Guide](CONTRIBUTING.md) to get started, or jump straight in:

- [Good First Issues](https://github.com/littlebearapps/pitchdocs/labels/good%20first%20issue) — Great starting points
- [Feature Requests](https://github.com/littlebearapps/pitchdocs/issues/new?template=feature_request.yml) — Suggest improvements
- [Open Issues](https://github.com/littlebearapps/pitchdocs/issues) — See what needs doing

## License

[MIT](LICENSE) — Made by [Little Bear Apps](https://littlebearapps.com)
