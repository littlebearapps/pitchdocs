---
name: public-readme
description: Generates READMEs with the Daytona/Banesullivan marketing framework — hero section, benefit-driven features, quickstart, comparison tables, and compelling CTAs. Produces docs that sell as well as they inform. Use when creating or overhauling a project README.
version: "1.0.0"
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

### GEO: Optimising for AI Citation

Follow the GEO section in the `doc-standards` rule. These README-specific additions ensure the README surfaces correctly in AI-generated answers:

1. **First paragraph as standalone definition** — The bold one-liner in the hero must work as a standalone definition if extracted with no surrounding context. LLMs quote top-of-page definitions when answering "what is X?" queries.
2. **Comparison section** — Include a "How It Compares" section (section 6 below) with a feature comparison table. LLMs surface these when answering "X vs Y" and "best X for Y" queries.
3. **Statistics and benchmarks** — Where evidence exists, include a benchmarks section or embed concrete numbers in feature descriptions. Content with statistics gets up to 28% more AI visibility.
4. **Semantic heading hierarchy** — Strict H1 > H2 > H3 without skipping levels. Descriptive headings containing topic keywords improve RAG chunking accuracy.
5. **Atomic feature descriptions** — Each feature bullet or table row should be comprehensible without reading the surrounding context. AI extractors often pull individual items, not entire sections.

### 1. Hero Section

**Project logo (optional but recommended):**

If the project has a logo, place it as the first element inside the centred container. A prominent logo creates instant visual identity and makes the repo feel polished and maintained.

```html
<p align="center">
  <img src="docs/assets/logo.svg" height="200" alt="Project Name" />
</p>
```

**Logo guidelines:**
- **Format**: SVG preferred (scales crisply on retina displays). PNG as fallback for complex raster logos.
- **Height**: `height="160"` to `height="240"` — scale to visual weight, not pixel count. Larger source images (1000x1000) use the lower end; smaller sources (300–500px) use the higher end. Never set both `width` and `height` unless the source aspect ratio requires it.
- **Background**: Transparent for README headers. Solid colour backgrounds are only for listing thumbnails (DevHunt, Product Hunt).
- **Breathing room**: Use separate `<p align="center">` blocks for the logo, tagline, badges, and links. Each `<p>` gets natural CSS margin from GitHub's stylesheet (~16px), creating consistent spacing without `<br>` hacks. Avoid `<br>` inside `<div>` blocks — GitHub's renderer collapses them unpredictably.
- **Dark mode support**: Use `<picture>` with `prefers-color-scheme` sources when the logo doesn't render well on both light and dark backgrounds:
  ```html
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="docs/assets/logo-dark.svg">
    <source media="(prefers-color-scheme: light)" srcset="docs/assets/logo-light.svg">
    <img src="docs/assets/logo-light.svg" height="200" alt="Project Name">
  </picture>
  ```
- **Wordmark logos**: If the logo contains the project name (a wordmark), omit the `# Project Name` heading to avoid duplication.
- **Storage**: `docs/assets/` or `.github/assets/` in the repo. For npm/PyPI-published packages, use absolute URLs (`https://raw.githubusercontent.com/org/repo/main/docs/assets/logo.svg`) — relative paths break on registry pages.
- **Alt text**: Always include descriptive alt text (the project name at minimum).

**Full hero template:**

```html
<p align="center">
  <img src="docs/assets/logo.svg" height="200" alt="Project Name" />
</p>

<p align="center">
  <strong>One compelling sentence that explains the value proposition — not what it IS, but what it DOES FOR YOU.</strong>
</p>

<p align="center">
  <a href="link"><img src="https://img.shields.io/github/actions/workflow/status/org/repo/ci.yml?branch=main" alt="Build" /></a>
  <a href="link"><img src="https://img.shields.io/codecov/c/github/org/repo" alt="Coverage" /></a>
  <a href="link"><img src="https://img.shields.io/npm/v/package-name" alt="npm" /></a>
  <a href="link"><img src="https://img.shields.io/github/license/org/repo" alt="License" /></a>
  <a href="link"><img src="https://img.shields.io/npm/dm/package-name" alt="Downloads" /></a>
</p>

<p align="center">
  <a href="link">Documentation</a> · <a href="link">Examples</a> · <a href="link">Discord</a> · <a href="link">Blog</a>
</p>

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

**Audience awareness:** The bold one-liner should resonate with both developers (what it does technically) and decision makers (what it achieves for the team/org). Test by asking: "Would a developer click through?" *and* "Would a team lead forward this link?"

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

### 3. Value Proposition

Frame the value proposition to serve two reader tracks simultaneously:

**Developer/Implementer track** (primary flow):
- Technical problem → technical solution with code evidence
- "How do I use this?" focus
- Quick start placement immediately follows

**Decision Maker/Ops track** (credibility signals and measurable outcomes):
- Business problem → measurable outcome
- "Why should we adopt this?" focus
- Links to SECURITY.md, compliance, team-scale evidence

Both tracks share the same section — structure serves both without duplication:

```markdown
## Why Project Name?

| Problem | Solution | Evidence |
|---------|----------|----------|
| Manual changelog writing wastes hours per release | Generates changelogs from conventional commits in seconds | `src/changelog.ts` |
| READMEs go stale within weeks of launch | Detects drift between code and docs, suggests updates | `hooks/context-drift-check.sh` |
| Hard to justify adoption to team leads | Test coverage, benchmarks, and adoption stats in README | `npm test -- --coverage` |
```

For projects with security, compliance, or enterprise appeal, add a **credibility row** pattern. Place these rows inside the "Why" section (not as a separate top-level section) — they serve the decision-maker track alongside the developer-facing problem/solution rows:

```markdown
| Trust signal | What it demonstrates | Where to verify |
|-------------|---------------------|----------------|
| SECURITY.md present | Transparent vulnerability process | [Security Policy](SECURITY.md) |
| Test coverage N% | Code quality and reliability | `npm test -- --coverage` |
```

**Placement guidance:** For most projects, credibility rows belong inside the "Why" section as a subheading ("### For decision makers") or a second table. Only create a standalone "Security & Trust" section after Features if the project has 4+ security signals (auth, encryption, compliance, dependency scanning) — otherwise the thin section hurts more than it helps.

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

Must achieve the **Time to Hello World** target for the detected project type (see `doc-standards` rule for targets by project type). State the TTHW explicitly where evidence supports it (e.g. "Get your first README in under 60 seconds").

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
- Never require the reader to leave the page — all prereqs listed upfront, all commands copy-paste-ready

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

## Cross-Renderer Compatibility

If the project is published to a package registry, the README renders on multiple platforms with different Markdown support. Load the `package-registry` skill for the full compatibility matrix.

**Key rules for multi-renderer READMEs:**
- **Always use absolute URLs for images** — relative paths break on npm and PyPI (`https://raw.githubusercontent.com/org/repo/main/docs/images/demo.gif`)
- **Avoid GitHub-specific callouts** (`[!NOTE]`, `[!WARNING]`) — render as plain text on npm and PyPI
- **Avoid heading anchor links** (`#section-name`) — broken on PyPI
- **Avoid `<details>`/`<summary>`** for critical content — unreliable on PyPI
- **Test before PyPI upload**: `twine check dist/*` validates README rendering
