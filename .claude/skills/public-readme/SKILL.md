---
name: public-readme
description: Generates READMEs with the Daytona/Banesullivan marketing framework — hero section, benefit-driven features, quickstart, comparison tables, and compelling CTAs. Produces docs that sell as well as they inform. Use when creating or overhauling a project README.
---

# Public README Generator

## README Structure (Recommended Order)

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
```

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

**Rules for the one-liner:**
- Maximum 15 words
- Starts with an action verb or benefit
- No technical jargon
- Examples:
  - "Ship Cloudflare Workers with confidence — cost safety, circuit breakers, and observability built in."
  - "Turn your git history into beautiful, user-facing changelogs."
  - "The fastest way to build type-safe APIs on the edge."

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

Use a table with a **Benefits** column:

```markdown
## Features

| Feature | Benefit | Status |
|---------|---------|--------|
| Automatic changelog generation | Save 30 minutes per release | :white_check_mark: Stable |
| Marketing-friendly language | Your changelog becomes a release announcement | :white_check_mark: Stable |
| GitHub integration | Pull issues, PRs, and releases automatically | :construction: Beta |
```

#### How to Populate This Table

1. Load the `feature-benefits` skill and run the 5-step Feature Extraction Workflow
2. Take all **Hero** and **Core** tier features from the classified inventory
3. Apply the feature-to-benefit translation for each — use at least 3 different benefit categories
4. Set status from evidence: `:white_check_mark: Stable` if tested and documented, `:construction: Beta` if experimental
5. No features without file/function evidence — if you can't point to code, don't list it

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
- **Don't include TOC for READMEs under 200 lines** — unnecessary noise

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
