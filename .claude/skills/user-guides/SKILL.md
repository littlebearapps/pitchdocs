---
name: user-guides
description: Generates task-oriented user guides and how-to documentation for a repository. Creates docs/guides/ with step-by-step instructions for common workflows, integrations, and advanced usage. Links guides into README.md and CONTRIBUTING.md. Use when a project needs user-facing how-to documentation beyond the README quickstart.
---

# User Guide Generator

## Philosophy

User guides answer the question: **"How do I do [specific thing]?"**

They complement the README (which sells and introduces) by providing detailed, task-oriented instructions for users who are already onboard.

## Guide Structure

### Directory Layout

```
docs/
├── guides/
│   ├── getting-started.md      # First-time setup, expanded quickstart
│   ├── configuration.md        # All config options explained
│   ├── [task-name].md          # One guide per common task
│   └── troubleshooting.md      # Common problems and solutions
├── api/                        # API reference (if applicable)
│   └── README.md
└── README.md                   # Docs index / hub page
```

### docs/README.md (Hub Page)

```markdown
# [Project Name] Documentation

## Getting Started

New to [Project Name]? Start here:

- [Getting Started Guide](guides/getting-started.md) — Installation, setup, and your first [thing]
- [Configuration Guide](guides/configuration.md) — All configuration options explained

## Guides

Step-by-step instructions for common tasks:

| Guide | What You'll Learn |
|-------|-------------------|
| [Getting Started](guides/getting-started.md) | Install, configure, and run your first [thing] |
| [Configuration](guides/configuration.md) | Customise behaviour with environment variables and config files |
| [Deployment](guides/deployment.md) | Deploy to production with CI/CD |
| [Migration](guides/migration.md) | Upgrade from v1.x to v2.x |
| [Troubleshooting](guides/troubleshooting.md) | Common issues and how to fix them |

## API Reference

- [API Documentation](api/README.md)

## Need Help?

- [FAQ](guides/troubleshooting.md#faq)
- [Open a Discussion](link)
- [File an Issue](link)
```

### Individual Guide Format

Every guide follows this structure:

```markdown
# [Task Name] Guide

> **Summary**: What you'll accomplish by the end of this guide.

## Prerequisites

- What you need before starting
- Link to getting-started if they haven't done setup

## Steps

### 1. [First Step]

Explanation of what this step does and why.

\`\`\`bash
command here
\`\`\`

Expected output:
\`\`\`
output here
\`\`\`

### 2. [Second Step]

...

### 3. [Verify It Works]

Always end with a verification step so the user knows they succeeded.

\`\`\`bash
verification command
\`\`\`

You should see:
\`\`\`
expected success output
\`\`\`

## What's Next?

- [Related Guide](link) — natural next step
- [Advanced Topic](link) — for power users
- [Back to Docs](../README.md)
```

## Guide Discovery Workflow

### Step 1: Identify What Guides Are Needed

Analyse the project to find:

```bash
# Check existing docs
find docs/ -name "*.md" 2>/dev/null | sort

# Check README for referenced guides that may not exist
grep -oE '\[.*?\]\(docs/[^)]+\)' README.md 2>/dev/null

# Check GitHub issues for common questions
gh issue list --label "question" --state all --limit 30 2>/dev/null
gh issue list --label "help wanted" --state all --limit 30 2>/dev/null

# Check discussions for common topics
gh api repos/{owner}/{repo}/discussions --jq '.[].title' 2>/dev/null | head -20

# Check for configuration files users need to understand
ls *.config.* .env.example wrangler.* tsconfig.* 2>/dev/null
```

### Step 2: Prioritise Guides

Create guides in this order:
1. **Getting Started** — always first, expanded version of README quickstart
2. **Configuration** — if the project has any config files or env vars
3. **Most-asked-about tasks** — based on issues and discussions
4. **Deployment** — if the project is deployed
5. **Migration** — if there have been breaking version changes
6. **Troubleshooting** — compile from closed issues and common errors

### Step 3: Write Guides

For each guide:
1. Read the relevant source code to understand the feature
2. Actually trace the user journey step by step
3. Include exact commands, expected outputs, and error handling
4. Add screenshots or diagrams for complex workflows
5. Cross-link to related guides and the README

### Step 4: Link Into README

Add a documentation section to README.md:

```markdown
## Documentation

| Guide | Description |
|-------|-------------|
| [Getting Started](docs/guides/getting-started.md) | Installation and first steps |
| [Configuration](docs/guides/configuration.md) | All config options |
| [Deployment](docs/guides/deployment.md) | Production deployment guide |
| [Troubleshooting](docs/guides/troubleshooting.md) | Common issues and solutions |

Full documentation: [docs/](docs/README.md)
```

## Troubleshooting Guide Template

```markdown
# Troubleshooting

Common issues and how to resolve them.

## Installation Issues

### Error: `MODULE_NOT_FOUND`

**Cause**: Dependencies not installed or wrong Node.js version.

**Fix**:
\`\`\`bash
rm -rf node_modules
npm install
\`\`\`

If the issue persists, check your Node.js version:
\`\`\`bash
node --version  # Must be 20+
\`\`\`

---

### Error: `EACCES permission denied`

**Cause**: npm global packages installed without proper permissions.

**Fix**:
\`\`\`bash
# Option 1: Use npx instead of global install
npx package-name

# Option 2: Fix npm permissions
# See: https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally
\`\`\`

---

## Runtime Issues

### [Symptom description]

**Cause**: [Why this happens]

**Fix**:
\`\`\`bash
[solution]
\`\`\`

---

## FAQ

### Q: [Common question]?

**A**: [Clear answer with example if applicable]

---

## Still Stuck?

- Search [existing issues](link)
- [Open a new issue](link) with the `help wanted` label
- [Ask in discussions](link)
```

## Writing Style

- **Task-oriented**: "How to deploy to production" not "Deployment documentation"
- **Numbered steps**: Every guide is a numbered sequence
- **Expected output**: Show what success looks like after each step
- **Error recovery**: Mention common mistakes and how to fix them
- **Cross-links**: Every guide links to related guides and back to the hub
- **Active voice**: "Run the command" not "The command should be run"
- **Consistent spelling**: follow the project's existing language conventions

## Anti-Patterns

- **Don't dump API reference into guides** — guides are task-oriented, API docs are reference
- **Don't assume knowledge** — link to prerequisites
- **Don't skip verification steps** — users need to know they succeeded
- **Don't write walls of text** — use code blocks, tables, and short paragraphs
- **Don't orphan guides** — every guide must be linked from README or docs hub
- **Don't mix guide and reference** — keep them in separate directories
