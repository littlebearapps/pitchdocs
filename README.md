<div align="center">

# repo-docs

**Generate repository documentation that sells as well as it informs.**

[![License](https://img.shields.io/github/license/littlebearapps/repo-docs-plugin)](LICENSE)
[![Claude Code Plugin](https://img.shields.io/badge/Claude_Code-Plugin-blue)](https://code.claude.com/docs/en/plugins)
[![GitHub stars](https://img.shields.io/github/stars/littlebearapps/repo-docs-plugin)](https://github.com/littlebearapps/repo-docs-plugin/stargazers)

[Installation](#installation) · [Commands](#commands) · [Skills](#skills) · [Contributing](CONTRIBUTING.md)

</div>

---

### Before repo-docs

```
# my-project
Install: npm install my-project
Usage: import thing from 'my-project'
License: MIT
```

### After repo-docs

```
# my-project
Ship production-ready APIs in minutes — type-safe, observable, cost-aware.

[Badges] [Quick links]

## Why my-project?
| Problem | Solution |
| Manual config is error-prone | Zero-config defaults with full override support |

## Quick Start (under 5 minutes)
## Features (with benefits column)
## Contributing (warm CTA + good-first-issues link)
```

---

## Why repo-docs?

Most documentation generators produce technically-accurate but dry output. Nobody reads it, nobody gets excited, nobody stars the repo.

repo-docs generates documentation with a **marketing edge** — docs that answer the reader's real questions:

| Question | How repo-docs Answers It |
|----------|-------------------------|
| Does this solve my problem? | Benefit-driven feature descriptions, not just specs |
| Can I use it? | Quick start that works in under 5 minutes |
| Who made it? | Badges, contributor counts, credibility signals |
| Where do I learn more? | Cross-linked guides, hub pages, community links |

## Installation

```bash
# Add the LBA marketplace (once)
/plugin marketplace add littlebearapps/lba-plugins

# Install the plugin
/plugin install repo-docs@lba-plugins
```

## Commands

| Command | What It Does | Why It Matters |
|---------|-------------|----------------|
| `/readme` | Generate or update a marketing-friendly README.md | First impressions that convert browsers to users |
| `/changelog` | Generate CHANGELOG.md from git history with user-benefit language | Users see what changed for *them*, not your commit log |
| `/roadmap` | Generate ROADMAP.md from GitHub milestones and issues | Show contributors where the project is heading |
| `/docs-audit` | Audit documentation completeness and quality | Never ship a repo missing critical docs again |
| `/user-guide` | Generate task-oriented user guides in `docs/guides/` | Readers find answers without reading your source code |

### Quick Examples

```bash
# Generate a README for the current project
/readme

# Generate the full changelog from all tags
/changelog full

# Audit what docs are missing and auto-generate them
/docs-audit fix

# Generate a getting-started user guide
/user-guide getting-started
```

## Skills

Skills are loaded on-demand to provide deep reference knowledge:

| Skill | Purpose |
|-------|---------|
| `public-readme` | README structure with the Daytona/Banesullivan marketing framework |
| `changelog` | Keep a Changelog format with user-benefit language rules |
| `roadmap` | Roadmap structure from GitHub Projects data |
| `repo-docs-suite` | Complete inventory of all repo docs — templates for CONTRIBUTING, CODE_OF_CONDUCT, SECURITY, issue templates, PR template |
| `user-guides` | Task-oriented how-to documentation in `docs/guides/` |

## Agent

The **docs-writer** agent handles long-form documentation generation. It analyses your codebase, extracts value propositions, and writes docs that pass the 4-question test. It is invoked automatically by the commands above when complex generation is needed.

## What You Get vs Writing Docs Manually

| Dimension | Writing by Hand | Using repo-docs |
|-----------|----------------|-----------------|
| Marketing framework | Ad hoc — varies per author | Daytona/Banesullivan 4-question test on every doc |
| Language consistency | Drifts over time | Australian English, benefit-driven tone, enforced by rules |
| Progressive disclosure | Often front-loads technical detail | Non-technical first, technical deeper — every time |
| Cross-linking | Usually forgotten | Automatic links between README, CONTRIBUTING, CHANGELOG |
| Completeness | Easy to miss files | 14-file audit catches gaps before you ship |

## Design Principles

- **Benefit-driven**: Describe what users gain, not just what the software does
- **Progressive disclosure**: Non-technical first paragraph, technical details deeper
- **4-question framework**: Every doc answers — Does this solve my problem? Can I use it? Who made it? Where to learn more?
- **Australian English**: realise, colour, behaviour, organisation (per LBA standards)
- **Cross-linked**: Every doc links to related docs — no orphaned pages

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

- [Good First Issues](https://github.com/littlebearapps/repo-docs-plugin/labels/good%20first%20issue) — Great starting points
- [Feature Requests](https://github.com/littlebearapps/repo-docs-plugin/issues/new?template=feature_request.yml) — Suggest improvements
- [Open Issues](https://github.com/littlebearapps/repo-docs-plugin/issues) — See what needs doing

## License

[MIT](LICENSE) — Made by [Little Bear Apps](https://littlebearapps.com)
