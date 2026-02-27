---
name: user-guides
description: Generates task-oriented user guides and how-to documentation for a repository. Creates docs/guides/ with step-by-step instructions for common workflows, integrations, and advanced usage. Links guides into README.md and CONTRIBUTING.md. Use when a project needs user-facing how-to documentation beyond the README quickstart.
version: "1.0.0"
---

# User Guide Generator

## Philosophy

User guides answer the question: **"How do I do [specific thing]?"**

They complement the README (which sells and introduces) by providing detailed, task-oriented instructions for users who are already onboard.

## Diataxis Framework

All documentation should be classified into one of four quadrants from the [Diataxis framework](https://diataxis.fr/). Each quadrant serves a different reader need:

| Quadrant | Purpose | Reader State | Directory |
|----------|---------|-------------|-----------|
| **Tutorials** | Learning-oriented lessons | "I want to learn" | `docs/tutorials/` |
| **How-to Guides** | Task-oriented recipes | "I want to do X" | `docs/guides/` |
| **Reference** | Information-oriented lookup | "I need to check Y" | `docs/reference/` or `docs/api/` |
| **Explanation** | Understanding-oriented context | "I want to understand why" | `docs/explanation/` |

**Rules:**
- Classify every document into exactly one quadrant before writing — don't mix tutorial prose with reference tables
- Tutorials walk through a complete learning journey; guides solve a specific task. A tutorial says "let's build a blog"; a guide says "how to add pagination"
- Reference docs are dry, accurate, and complete — every parameter, every option, every return type. No narrative.
- Explanation docs cover architecture decisions, design philosophy, and "why it works this way" — they complement reference without duplicating it
- Not every project needs all four quadrants. At minimum, provide **How-to Guides** (this skill's primary output) and link to any existing reference docs.

### Classifying Existing Docs

During the guide discovery workflow (Step 1), classify each existing and needed document:

```
Tutorials:     docs/tutorials/build-your-first-app.md
How-to Guides: docs/guides/getting-started.md, docs/guides/configuration.md
Reference:     docs/reference/api.md, docs/reference/cli.md
Explanation:   docs/explanation/architecture.md, docs/explanation/security-model.md
```

Flag any quadrant with zero documents — this indicates a documentation gap worth addressing.

## Guide Structure

### Directory Layout

```
docs/
├── tutorials/                  # Learning-oriented lessons (Diataxis: Tutorial)
│   └── build-your-first-app.md
├── guides/                     # Task-oriented how-to recipes (Diataxis: How-to)
│   ├── getting-started.md      # First-time setup, expanded quickstart
│   ├── configuration.md        # All config options explained
│   ├── [task-name].md          # One guide per common task
│   └── troubleshooting.md      # Common problems and solutions
├── reference/                  # Information-oriented lookup (Diataxis: Reference)
│   ├── api.md                  # API reference
│   └── cli.md                  # CLI reference
├── explanation/                # Understanding-oriented context (Diataxis: Explanation)
│   └── architecture.md         # Design decisions and architecture
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
- **Error recovery**: After each step, show common failure modes and how to fix them
- **Cross-links**: Every guide links to related guides, Diataxis siblings, and back to the hub
- **Active voice**: "Run the command" not "The command should be run"
- **Consistent spelling**: follow the project's existing language conventions
- **Copy-paste-ready code**: Every code block must be runnable as-is — no `...` placeholders, no incomplete snippets, no "replace with your value" without showing the exact replacement

### Copy-Paste-Ready Code Examples

Every code block in a guide must be directly executable:

```markdown
### 2. Configure the database

Create a `wrangler.toml` configuration file:

\`\`\`toml
name = "my-api"
compatibility_date = "2024-01-01"

[[d1_databases]]
binding = "DB"
database_name = "my-database"
database_id = "your-database-id"
\`\`\`

**Note:** Replace `your-database-id` with the ID from step 1. You can find it by running `wrangler d1 list`.
```

**Rules:**
- Include import statements — don't assume readers know the package name
- Show expected output after every command
- Use realistic values (not `foo`, `bar`, `test123`) — readers copy-paste and expect real patterns
- If a value must be customised, call it out explicitly after the code block

### Error Recovery Patterns

After each major step, include a collapsible troubleshooting section for common failures:

```markdown
### 3. Start the development server

\`\`\`bash
npm run dev
\`\`\`

You should see:
\`\`\`
Server running at http://localhost:3000
\`\`\`

<details>
<summary><strong>Troubleshooting: Port already in use</strong></summary>

If you see `Error: listen EADDRINUSE :::3000`:

\`\`\`bash
# Find and kill the process using port 3000
lsof -ti:3000 | xargs kill -9
npm run dev
\`\`\`

</details>
```

Use `<details>` for error recovery so it doesn't clutter the happy path. For GitHub-only guides, this collapses neatly; for cross-renderer guides, use a bold inline callout instead.

### Video and Screencast Placeholders

When a guide involves CLI interaction or multi-step UI workflows, suggest terminal recording placement:

```markdown
### Demo

<!-- Terminal recording: Run `asciinema rec` before starting, `asciinema upload` when done -->
<!-- Suggested recording: Steps 1-3 (install, configure, verify) in a single session -->
<!-- Alternative: Record a 30-second GIF with `terminalizer` or `vhs` -->

Watch the [terminal recording](link) to see the full setup flow.
```

**When to suggest recordings:**
- Getting started guides (always)
- Guides with 5+ CLI steps
- Guides involving interactive prompts or TUI interfaces
- Migration guides where the before/after is instructive

### Diataxis Cross-Links

Each guide must link to related documents in other Diataxis quadrants:

```markdown
## What's Next?

- **Tutorial**: [Build Your First App](../tutorials/build-first-app.md) — hands-on lesson that builds on this setup
- **Reference**: [CLI Reference](../reference/cli.md) — all flags and options for commands used in this guide
- **Explanation**: [Architecture Overview](../explanation/architecture.md) — understand why the project is structured this way
- [Back to Docs Hub](../README.md)
```

## Anti-Patterns

- **Don't dump API reference into guides** — guides are task-oriented, API docs are reference (use Diataxis separation)
- **Don't assume knowledge** — link to prerequisites
- **Don't skip verification steps** — users need to know they succeeded
- **Don't write walls of text** — use code blocks, tables, and short paragraphs
- **Don't orphan guides** — every guide must be linked from README or docs hub
- **Don't mix guide and reference** — keep them in separate Diataxis quadrants
- **Don't use placeholder code** — every code block must be copy-paste-ready with realistic values
- **Don't bury prerequisites in prose** — use a structured prerequisites block (see `doc-standards` GEO section)
