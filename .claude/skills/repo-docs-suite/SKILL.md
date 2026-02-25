---
name: repo-docs-suite
description: One-command generation and audit of the full public repository documentation set — README, CHANGELOG, ROADMAP, CONTRIBUTING, CODE_OF_CONDUCT, SECURITY, issue templates, PR template, and discussion templates. Use when setting up a new repo or auditing an existing one.
---

# Repository Documentation Suite

## Complete Docs Inventory

A well-documented public repository should have these files:

### Tier 1: Essential (Every Public Repo)

| File | Purpose | Generator |
|------|---------|-----------|
| `README.md` | First impression, value proposition, quickstart | `public-readme` skill |
| `LICENSE` | Legal terms for usage | Auto-detect from package.json |
| `CONTRIBUTING.md` | How to contribute code, report bugs, suggest features | This skill |
| `.github/ISSUE_TEMPLATE/bug_report.yml` | Structured bug reports | This skill |
| `.github/ISSUE_TEMPLATE/feature_request.yml` | Feature proposals | This skill |
| `.github/PULL_REQUEST_TEMPLATE.md` | PR checklist and description template | This skill |

### Tier 2: Professional (Active Projects)

| File | Purpose | Generator |
|------|---------|-----------|
| `CHANGELOG.md` | User-facing change history | `changelog` skill |
| `CODE_OF_CONDUCT.md` | Community behaviour standards | This skill |
| `SECURITY.md` | Vulnerability reporting process | This skill |
| `.github/ISSUE_TEMPLATE/config.yml` | Issue template chooser config | This skill |
| `.github/FUNDING.yml` | Sponsorship links | This skill |
| `docs/README.md` | Documentation hub page | `user-guides` skill |
| `docs/guides/getting-started.md` | Expanded quickstart for new users | `user-guides` skill |

### Tier 3: Mature (Established Projects)

| File | Purpose | Generator |
|------|---------|-----------|
| `ROADMAP.md` | Public development roadmap | `roadmap` skill |
| `docs/guides/configuration.md` | All config options explained | `user-guides` skill |
| `docs/guides/deployment.md` | Production deployment guide | `user-guides` skill |
| `docs/guides/troubleshooting.md` | Common issues and solutions | `user-guides` skill |
| `.github/DISCUSSION_TEMPLATE/` | Structured discussion categories | This skill |
| `.github/CODEOWNERS` | Automatic review assignment | Manual |

## Audit Workflow

### Step 1: Scan Existing Docs

```bash
# Check for all expected files
for f in README.md LICENSE CONTRIBUTING.md CHANGELOG.md ROADMAP.md CODE_OF_CONDUCT.md SECURITY.md; do
  [ -f "$f" ] && echo "✓ $f" || echo "✗ $f (missing)"
done

# Check .github templates
for f in .github/ISSUE_TEMPLATE/bug_report.yml .github/ISSUE_TEMPLATE/feature_request.yml .github/PULL_REQUEST_TEMPLATE.md .github/ISSUE_TEMPLATE/config.yml; do
  [ -f "$f" ] && echo "✓ $f" || echo "✗ $f (missing)"
done

# Check for common alternatives
[ -f ".github/ISSUE_TEMPLATE/bug_report.md" ] && echo "⚠ bug_report.md found (consider migrating to YAML forms)"
```

### Step 2: Quality Check Existing Files

For each existing file, check:
- **README.md**: Does it pass the 4-question test? Does it have badges? Is the quickstart working?
- **CONTRIBUTING.md**: Does it match the actual development workflow?
- **CHANGELOG.md**: Is it up to date with the latest release?
- **SECURITY.md**: Does it include a responsible disclosure process?

### Step 3: Generate Missing Files

Use the appropriate skill/template for each missing file. Generate in priority order:
1. README.md (if missing or needs overhaul)
2. CONTRIBUTING.md
3. Issue templates
4. PR template
5. CHANGELOG.md
6. Everything else

## Templates

### CONTRIBUTING.md

```markdown
# Contributing to [Project Name]

Thank you for your interest in contributing! This guide will help you get started.

## Quick Links

- [Open Issues](link) — Find something to work on
- [Good First Issues](link) — Perfect for new contributors
- [Discussion Forum](link) — Ask questions, propose ideas

## Development Setup

### Prerequisites

- [Runtime] version [X]+
- [Package manager]

### Getting Started

\`\`\`bash
# Clone the repo
git clone https://github.com/org/repo.git
cd repo

# Install dependencies
npm install

# Run tests to verify setup
npm test

# Start development
npm run dev
\`\`\`

## How to Contribute

### Reporting Bugs

1. Search [existing issues](link) to avoid duplicates
2. Use the [bug report template](link)
3. Include: what you expected, what happened, steps to reproduce

### Suggesting Features

1. Check the [roadmap](ROADMAP.md) — it might already be planned
2. Open a [feature request](link)
3. Describe the problem you're solving, not just the solution you want

### Submitting Code

1. Fork the repo and create a branch: `git checkout -b feature/your-feature`
2. Write your code and tests
3. Ensure all tests pass: `npm test`
4. Ensure linting passes: `npm run lint`
5. Commit using [conventional commits](https://conventionalcommits.org/): `feat: add thing`
6. Push and open a pull request

### Commit Messages

We use [Conventional Commits](https://conventionalcommits.org/):

- `feat: add new feature` — New functionality
- `fix: resolve bug` — Bug fix
- `docs: update readme` — Documentation only
- `test: add tests` — Test additions
- `refactor: restructure code` — Code change that doesn't fix a bug or add a feature
- `chore: update deps` — Maintenance tasks

### Code Review

All submissions require review. We aim to review PRs within 48 hours. We may suggest changes, improvements, or alternatives.

## Code of Conduct

This project follows the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md). By participating, you agree to uphold this code.

## Questions?

- Open a [discussion](link)
- File an [issue](link)

Thank you for making [Project Name] better!
```

### CODE_OF_CONDUCT.md

Use the [Contributor Covenant v3.0](https://www.contributor-covenant.org/version/3/0/code_of_conduct/). Replace placeholders with:
- Project name
- Contact email for reporting
- Enforcement guidelines

Key v3.0 changes from v2.1: clearer language, less US-centric phrasing, "Addressing and Repairing Harm" section aligned with restorative justice principles. Always use v3.0 for new projects.

### SECURITY.md

```markdown
# Security Policy

## Supported Versions

| Version | Supported |
|---------|-----------|
| 1.x.x | :white_check_mark: |
| < 1.0 | :x: |

## Reporting a Vulnerability

**Please do not report security vulnerabilities through public GitHub issues.**

Instead, please report them via:
- Email: security@[domain].com
- [GitHub Security Advisories](https://github.com/org/repo/security/advisories/new)

### What to Include

- Description of the vulnerability
- Steps to reproduce
- Potential impact
- Suggested fix (if any)

### Response Timeline

- **Acknowledgement**: Within 48 hours
- **Initial assessment**: Within 1 week
- **Fix timeline**: Depends on severity, typically 1-4 weeks

### Disclosure Policy

We follow [coordinated disclosure](https://en.wikipedia.org/wiki/Coordinated_vulnerability_disclosure). We'll work with you to understand and address the issue before any public disclosure.

## Security Updates

Security patches are released as soon as possible and noted in [CHANGELOG.md](CHANGELOG.md) under the **Security** category.
```

### .github/ISSUE_TEMPLATE/bug_report.yml

```yaml
name: Bug Report
description: Report a bug to help us improve
title: "[Bug]: "
labels: ["bug", "triage"]
body:
  - type: markdown
    attributes:
      value: |
        Thanks for reporting a bug! Please fill out the sections below.
  - type: textarea
    id: description
    attributes:
      label: What happened?
      description: A clear description of the bug.
      placeholder: Tell us what went wrong...
    validations:
      required: true
  - type: textarea
    id: expected
    attributes:
      label: What did you expect?
      description: What should have happened instead?
    validations:
      required: true
  - type: textarea
    id: reproduce
    attributes:
      label: Steps to reproduce
      description: Minimal steps to reproduce the issue.
      placeholder: |
        1. Run `command`
        2. Pass input `...`
        3. See error
    validations:
      required: true
  - type: input
    id: version
    attributes:
      label: Version
      description: What version are you using?
      placeholder: "1.2.3"
    validations:
      required: true
  - type: dropdown
    id: os
    attributes:
      label: Operating System
      options:
        - macOS
        - Linux
        - Windows
        - Other
    validations:
      required: true
  - type: textarea
    id: logs
    attributes:
      label: Relevant logs
      description: Paste any relevant error messages or logs.
      render: shell
```

### .github/ISSUE_TEMPLATE/feature_request.yml

```yaml
name: Feature Request
description: Suggest a new feature or improvement
title: "[Feature]: "
labels: ["enhancement"]
body:
  - type: markdown
    attributes:
      value: |
        Thanks for suggesting a feature! Help us understand the problem you're solving.
  - type: textarea
    id: problem
    attributes:
      label: What problem does this solve?
      description: Describe the problem or limitation you're facing.
      placeholder: "I'm always frustrated when..."
    validations:
      required: true
  - type: textarea
    id: solution
    attributes:
      label: Proposed solution
      description: How would you like this to work?
    validations:
      required: true
  - type: textarea
    id: alternatives
    attributes:
      label: Alternatives considered
      description: Have you considered any workarounds or alternatives?
  - type: textarea
    id: context
    attributes:
      label: Additional context
      description: Any other context, screenshots, or examples.
```

### .github/ISSUE_TEMPLATE/config.yml

```yaml
blank_issues_enabled: false
contact_links:
  - name: Question / Help
    url: https://github.com/org/repo/discussions/categories/q-a
    about: Ask questions and get help from the community
  - name: Feature Discussion
    url: https://github.com/org/repo/discussions/categories/ideas
    about: Discuss feature ideas before opening a formal request
```

### .github/PULL_REQUEST_TEMPLATE.md

```markdown
## What

<!-- Brief description of the change -->

## Why

<!-- What problem does this solve? Link to issue if applicable -->

Closes #

## How

<!-- How was it implemented? Any design decisions worth noting? -->

## Testing

- [ ] Tests added/updated
- [ ] All tests pass (`npm test`)
- [ ] Linting passes (`npm run lint`)

## Checklist

- [ ] Code follows project conventions
- [ ] Self-reviewed the diff
- [ ] No secrets or credentials included
- [ ] Documentation updated (if applicable)
```

### .github/FUNDING.yml

```yaml
github: [username]
# ko_fi: username
# open_collective: project-name
# custom: ["https://example.com/donate"]
```
