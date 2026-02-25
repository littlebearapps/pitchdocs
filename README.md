<div align="center">

# repo-docs

**Generate repository documentation that sells as well as it informs.**

[![License](https://img.shields.io/github/license/littlebearapps/repo-docs-plugin)](LICENSE)
[![Claude Code Plugin](https://img.shields.io/badge/Claude_Code-Plugin-blue)](https://code.claude.com/docs/en/plugins)

[Installation](#installation) · [Commands](#commands) · [Skills](#skills) · [Contributing](CONTRIBUTING.md)

</div>

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

| Command | What It Does |
|---------|-------------|
| `/readme` | Generate or update a marketing-friendly README.md |
| `/changelog` | Generate CHANGELOG.md from git history with user-benefit language |
| `/roadmap` | Generate ROADMAP.md from GitHub milestones and issues |
| `/docs-audit` | Audit documentation completeness and quality — shows what's missing |
| `/user-guide` | Generate task-oriented user guides in `docs/guides/` |

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

Contributions welcome! See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

- [Open Issues](https://github.com/littlebearapps/repo-docs-plugin/issues)
- [Feature Requests](https://github.com/littlebearapps/repo-docs-plugin/issues/new?template=feature_request.yml)

## License

[MIT](LICENSE) — Made by [Little Bear Apps](https://littlebearapps.com)
