# Contributing to repo-docs

Thank you for your interest in contributing! This plugin helps generate better repository documentation, and we'd love your help making it even better.

## Quick Links

- [Open Issues](https://github.com/littlebearapps/repo-docs-plugin/issues) — Find something to work on
- [Feature Requests](https://github.com/littlebearapps/repo-docs-plugin/issues/new?template=feature_request.yml) — Suggest improvements

## How the Plugin Works

This is a Claude Code plugin — a collection of markdown files that extend Claude's capabilities. There is no compiled code, no build step, and no runtime dependencies.

```
repo-docs-plugin/
├── .claude-plugin/plugin.json     # Plugin manifest
├── .claude/
│   ├── agents/docs-writer.md      # Long-form doc generation agent
│   ├── rules/doc-standards.md     # Tone, language, and quality standards
│   └── skills/                    # Reference knowledge (loaded on-demand)
│       ├── public-readme/SKILL.md
│       ├── changelog/SKILL.md
│       ├── roadmap/SKILL.md
│       ├── repo-docs-suite/SKILL.md
│       └── user-guides/SKILL.md
├── commands/                      # Slash commands (/readme, /changelog, etc.)
└── upstream-versions.json         # Pinned upstream spec versions
```

## Development Setup

```bash
# Clone the repo
git clone https://github.com/littlebearapps/repo-docs-plugin.git
cd repo-docs-plugin

# That's it — no dependencies to install
```

To test changes locally, install the plugin from your local path:
```bash
# In Claude Code, point to your local clone
/plugin install /path/to/repo-docs-plugin
```

## How to Contribute

### Improving Documentation Templates

The most impactful contributions improve the quality of generated docs. Look at the skills in `.claude/skills/` — each contains templates, language rules, and anti-patterns.

When improving a template:
1. Show a before/after example of the generated output
2. Explain why the new version is better for the reader
3. Ensure Australian English spelling (realise, colour, behaviour)

### Adding New Skills or Commands

1. Create the skill in `.claude/skills/<name>/SKILL.md` with proper frontmatter
2. Create the command in `commands/<name>.md` with proper frontmatter
3. Update the `repo-docs-suite` skill if the new doc type should appear in audits
4. Update `README.md` with the new skill/command

### Updating Upstream Specifications

When an upstream spec changes (Keep a Changelog, Contributor Covenant, etc.):
1. Update the relevant skill content
2. Update `upstream-versions.json` with the new version and date
3. Note the key changes in your PR description

### Commit Messages

We use [Conventional Commits](https://www.conventionalcommits.org/):

- `feat: add new skill` — New functionality
- `fix: correct badge URL pattern` — Bug fix
- `docs: update readme` — Documentation only
- `chore: update upstream versions` — Maintenance

### Pull Requests

1. Fork the repo and create a branch: `git checkout -b feature/your-feature`
2. Make your changes
3. Commit using conventional commits
4. Push and open a pull request using the [PR template](.github/PULL_REQUEST_TEMPLATE.md)

## Code of Conduct

This project follows the [Contributor Covenant v3.0 Code of Conduct](CODE_OF_CONDUCT.md). By participating, you agree to uphold this code.

## Questions?

[Open an issue](https://github.com/littlebearapps/repo-docs-plugin/issues/new) — we're happy to help.

Thank you for making repo-docs better!
