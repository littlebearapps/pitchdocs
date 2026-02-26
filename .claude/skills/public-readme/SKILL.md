---
name: public-readme
description: Generates READMEs with the Daytona/Banesullivan marketing framework — hero section, benefit-driven features, quickstart, comparison tables, and compelling CTAs. Produces docs that sell as well as they inform. Use when creating or overhauling a project README.
---

# Public README Generator

## README Structure (Recommended Order)

**Output formatting conventions** (see `doc-standards` rule for the full reference):
- Prefix each H2 section heading with an emoji from the standard table
- Separate major sections with `---` horizontal rules
- The numbered sections below (1–9) indicate recommended ORDER — the actual output uses H2 headings with emoji prefixes, not numbered H3s

Example of how sections appear in the final README output:

```markdown
---

## 💡 Why ProjectName?

| Problem | Solution |
|---------|----------|
| Manual changelog writing is tedious | Generates changelogs from conventional commits |

---

## ⚡ Quick start

\`\`\`bash
npm install project-name
\`\`\`

---

## 🎯 Features

| Feature | Benefit | Status |
|---------|---------|--------|
| Feature A | Saves 30 min per release | :white_check_mark: Stable |
```

### 1. Hero Section

```markdown
<div align="center">

# Project Name

**One compelling sentence that explains the value proposition — not what it IS, but what it DOES FOR YOU.**

[![Build](https://img.shields.io/github/actions/workflow/status/org/repo/ci.yml?branch=main)](link)
[![Coverage](https://img.shields.io/codecov/c/github/org/repo)](link)
[![npm](https://img.shields.io/npm/v/package-name)](link)
[![License](https://img.shields.io/github/license/org/repo)](link)
[![Downloads](https://img.shields.io/npm/dm/package-name)](link)

[Documentation](link) · [Examples](link) · [Discord](link) · [Blog](link)

</div>

---
```

The `---` after the hero creates a visual break before the content body. For READMEs with 7+ sections, add a table of contents between the hero `---` and the first content section (see `doc-standards` rule for emoji anchor format).

**Registry-specific badge guidance:**

For npm-published packages, include after CI/coverage badges:
```markdown
[![npm](https://img.shields.io/npm/v/PACKAGE-NAME)](https://www.npmjs.com/package/PACKAGE-NAME)
[![npm downloads](https://img.shields.io/npm/dm/PACKAGE-NAME)](https://www.npmjs.com/package/PACKAGE-NAME)
[![types](https://img.shields.io/npm/types/PACKAGE-NAME)](https://www.npmjs.com/package/PACKAGE-NAME)
```

For PyPI-published packages:
```markdown
[![PyPI](https://img.shields.io/pypi/v/PACKAGE-NAME)](https://pypi.org/project/PACKAGE-NAME/)
[![Python versions](https://img.shields.io/pypi/pyversions/PACKAGE-NAME)](https://pypi.org/project/PACKAGE-NAME/)
[![PyPI downloads](https://img.shields.io/pypi/dm/PACKAGE-NAME)](https://pypi.org/project/PACKAGE-NAME/)
```

Load the `package-registry` skill for the full badge inventory and cross-renderer compatibility guidance.

**Three-part hero structure:**

1. **Bold one-liner** (maximum 15 words) — explains what the project provides, not just what it is. Starts with an action verb or benefit. No jargon.
   - "Ship Cloudflare Workers with confidence — cost safety, circuit breakers, and observability built in."
   - "GitHub repository documentation skills and templates for AI coding assistants."
   - "The fastest way to build type-safe APIs on the edge."

2. **Explanatory sentence** — one sentence covering scope, capabilities, and key selling points. Mention what the tool does end-to-end and any compatibility/ecosystem signals (SEO/GEO, npm/PyPI, cross-platform, etc.).
   - "Give your AI the knowledge to map out any codebase, extract a features-and-benefits summary, then create, enhance, and maintain professional public-facing GitHub repository docs — SEO and GEO ready with llms.txt, and npm/PyPI registry compatible."
   - "Automatically generates changelogs from conventional commits, roadmaps from GitHub milestones, and READMEs with marketing-friendly features tables."

3. **Badges and compatibility line** — standard shields.io badges (version, licence, CI), plus any platform/ecosystem badges that signal where the project fits.
   - `[![Claude Code Plugin](badge-url)](link) [![OpenCode Compatible](badge-url)](link) [![npm & PyPI Ready](badge-url)](link)`

### 2. Visual Element (Optional but High-Impact)

- Screenshot, demo GIF, or terminal recording
- Architecture diagram for infrastructure projects
- Before/after comparison for tools
- Keep under 800px wide, optimised for GitHub's renderer

```markdown
<div align="center">
  <img src="docs/images/demo.gif" alt="Quick start demo showing project setup in 30 seconds" width="700" />
</div>
```

**Where to store visual assets:**
- **In-repo** (`docs/images/` or `assets/`): version-controlled, always accessible. Best for files under 5MB.
- **GitHub user-content**: drag-drop an image into any GitHub issue or PR to get a permanent `user-images.githubusercontent.com` URL. Keeps repo size small.
- **GitHub Release assets**: for larger files (>5MB) without bloating git history.

**Format guidance:**
- SVG for diagrams and architecture charts (scales perfectly)
- PNG for screenshots and UI captures (lossless)
- GIF for demo recordings (<10MB GitHub limit, aim for ~10fps)
- Always include descriptive alt text for accessibility

### 3. Why [Project Name]?

Frame features as **solutions to real problems**. Use the pattern:

```markdown
## Why Project Name?

| Problem | Solution |
|---------|----------|
| Manual changelog writing is tedious and inconsistent | Automatically generates changelogs from conventional commits |
| READMEs go stale within weeks of launch | Detects drift between code and docs, suggests updates |
| New contributors don't know where to start | Generates CONTRIBUTING.md with your actual workflow |
```

Alternative format for fewer features:

```markdown
## Why Project Name?

- **Problem you solve** — How you solve it, and why your approach is better
- **Another pain point** — Your elegant solution, with a specific metric if possible
- **Third benefit** — Concrete outcome the user can expect
```

### 3.5 Use-Case Framing (Optional — High Impact)

For projects with multiple capabilities, add a "What [Project] Does" section between the hero and the detailed features. Frame each capability as a **reader-centric scenario** — start with the user's situation, then explain how the project helps.

```markdown
## 🚀 What ProjectName Does

### [Use case A — short title]

You've finished your MVP. The repo is about to go public. You need [thing the user needs]...

ProjectName [does X], [does Y], and [does Z]. Run `command` and get [outcome].

### [Use case B — short title]

Beyond [thing A], a professional project needs [thing B, C, D]...

Run `command` to [do everything], or use `individual-command` for just what you need.

### [Use case C — short title]

Great [thing] is useless if nobody finds it. ProjectName handles [discovery]:

- **Feature A** — benefit
- **Feature B** — benefit
```

**Rules:**
- 2–4 use cases maximum — enough to show breadth, not so many it overwhelms
- Each scenario opens with reader context ("You've finished...", "Beyond X, you need...", "Great X is useless if...")
- Each scenario ends with a concrete action the user can take (a command, a link, a next step)
- Use H3 subheadings within the section for each scenario
- Skip this section for single-purpose tools — the "Why" section is sufficient

### 4. Quick Start

Must work in **under 5 minutes** for a developer who's never seen the project.

```markdown
## Quick Start

### Prerequisites

- Node.js 20+ (or relevant runtime)
- npm/pnpm/yarn

### Install

\`\`\`bash
npm install package-name
\`\`\`

### Usage

\`\`\`typescript
import { thing } from 'package-name'

// Minimal working example — 5 lines or fewer
const result = await thing.doSomething({
  input: 'hello'
})
console.log(result) // Expected output
\`\`\`
```

**Rules:**
- Show the SIMPLEST possible usage first
- Include expected output in comments
- Use TypeScript if the project supports it
- Link to full docs for advanced usage

### 5. Features

Two formats are available. Choose based on content:

**Bold+em-dash bullets** (recommended for 5+ features — more scannable):

```markdown
## Features

- **Feature name** — benefit description with evidence
- **Another feature** — benefit description with evidence
- **Third feature** — benefit description with evidence
```

The bold text creates visual anchors, the em-dash cleanly separates "what" from "why", and each item gets breathing room. Use when feature descriptions vary in length or don't need structured comparison.

**Table with benefits column** (use for structured comparisons or when status tracking is needed):

```markdown
## Features

| Feature | Benefit | Status |
|---------|---------|--------|
| Automatic changelog generation | Save 30 minutes per release | :white_check_mark: Stable |
| Marketing-friendly language | Your changelog becomes a release announcement | :white_check_mark: Stable |
| GitHub integration | Pull issues, PRs, and releases automatically | :construction: Beta |
```

Use when features need status indicators, direct side-by-side comparison, or when the list is short (under 5 items).

#### How to Populate Features

1. Load the `feature-benefits` skill and run the 5-step Feature Extraction Workflow
2. Take all **Hero** and **Core** tier features from the classified inventory
3. Apply the feature-to-benefit translation for each — use at least 3 different benefit categories
4. For tables: set status from evidence (`:white_check_mark: Stable` if tested, `:construction: Beta` if experimental)
5. No features without file/function evidence — if you can't point to code, don't list it

**Rules for both formats:**
- Every feature must have evidence (file path, function, config option)
- Use at least 3 different benefit categories across the list
- Feature names should be concise (2–5 words) — put detail in the benefit text

**One-liner generation**: Synthesise from Hero features. Pattern: "Ship [outcome] with [how]" or "[Action verb] [what users gain] — [key differentiator]."

### 6. Comparison (If Applicable)

Only include if there are genuine alternatives. Be honest and fair.

```markdown
## How It Compares

| Feature | Project Name | Alternative A | Alternative B |
|---------|-------------|---------------|---------------|
| Marketing-friendly output | :white_check_mark: | :x: | Partial |
| 4-question framework | :white_check_mark: | :x: | :x: |
| GitHub MCP integration | :white_check_mark: | :x: | :white_check_mark: |
```

### 7. Documentation Links

```markdown
## Documentation

- [Getting Started Guide](docs/getting-started.md)
- [API Reference](docs/api.md)
- [Configuration](docs/configuration.md)
- [Examples](examples/)
- [FAQ](docs/faq.md)
```

### 8. Contributing

Brief section with link to CONTRIBUTING.md:

```markdown
## Contributing

We welcome contributions! See our [Contributing Guide](CONTRIBUTING.md) for details.

- [Open Issues](link) — Good first issues labelled
- [Discussion Forum](link) — Ask questions, propose features
```

### 9. License & Credits

```markdown
## License

[MIT](LICENSE) — Made with care by [Author/Org](link)
```

## Anti-Patterns to Avoid

- **Don't start with installation** — sell the value first
- **Don't list every API method** — link to API docs instead
- **Don't use "simple" or "easy"** — show, don't tell
- **Don't include build instructions** — that's for CONTRIBUTING.md
- **Don't use "we" excessively** — use "you" to address the reader
- **Don't show error handling in quickstart** — keep it minimal
- **Don't include TOC for READMEs under 7 sections** — the hero quick-links row is sufficient for shorter docs
- **Don't use emoji heading prefixes for READMEs under 5 sections** — the visual overhead outweighs the navigation benefit

## Tone Examples

**Bad:** "This library provides a set of utilities for generating documentation files."
**Good:** "Stop writing READMEs by hand. Generate docs that actually make people want to use your project."

**Bad:** "We implemented a new changelog generation algorithm."
**Good:** "Your git history becomes a beautiful changelog — automatically, on every release."

**Bad:** "Features: Markdown support, CLI interface, configuration files."
**Good:** "Write once, publish everywhere — Markdown docs that render perfectly on GitHub, npm, and your docs site."

## Cross-Renderer Compatibility

If the project is published to a package registry, the README renders on multiple platforms with different Markdown support. Load the `package-registry` skill for the full compatibility matrix.

**Key rules for multi-renderer READMEs:**
- **Always use absolute URLs for images** — relative paths break on npm and PyPI (`https://raw.githubusercontent.com/org/repo/main/docs/images/demo.gif`)
- **Avoid GitHub-specific callouts** (`[!NOTE]`, `[!WARNING]`) — render as plain text on npm and PyPI
- **Avoid heading anchor links** (`#section-name`) — broken on PyPI
- **Avoid `<details>`/`<summary>`** for critical content — unreliable on PyPI
- **Test before PyPI upload**: `twine check dist/*` validates README rendering
