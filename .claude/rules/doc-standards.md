# Documentation Standards

When generating public-facing repository documentation, follow these principles:

## The 4-Question Test (Banesullivan Framework)

Every document must answer these questions for the reader:

1. **Does this solve my problem?** — Clear problem statement and value proposition in the first paragraph
2. **Can I use it?** — Installation, prerequisites, and quickstart within 30 seconds of reading
3. **Who made it?** — Credibility signals: author, contributors, badges, community size
4. **Where do I learn more?** — Links to docs, examples, community, and support channels

## Progressive Disclosure

- First paragraph: non-technical, benefit-focused, anyone can understand
- Second section: quick start for developers who want to try it NOW
- Deeper sections: technical details, API reference, architecture
- A familiar user should be able to refresh their memory without scrolling past the fold

## Tone & Language

- Consistent language — follow the project's existing locale and spelling conventions
- Professional-yet-approachable — confident, not corporate
- Benefit-driven: describe what users GAIN, not just what the software DOES
- "You can now..." not "We implemented..." — reader-centric framing
- Active voice. Short sentences. No jargon without explanation.

## Feature-to-Benefit Writing

Every feature mentioned in documentation must be translated into a user benefit.

**The pattern:**
```
[Technical feature] so you can [user outcome] — [evidence]
```

**Examples:**
- "Automatic changelog from git history **so you can** ship release notes in seconds — not hours"
- "TypeScript-first with strict mode **so you can** catch errors before they reach production"
- "14-file documentation audit **so you can** never ship a repo with missing docs again"

**5 benefit categories** — use at least 3 different categories across any features table:

| Category | User Feels | Pattern |
|----------|-----------|---------|
| Time saved | "That was fast" | "Do X in Y instead of Z" |
| Confidence gained | "I trust this" | "Know that X because Y" |
| Pain avoided | "I don't have to worry" | "Never worry about X again" |
| Capability unlocked | "Now I can do something new" | "Now you can X" |
| Cost reduced | "This saves me money/effort" | "One tool replaces N" |

**Evidence requirement:** Every benefit claim must trace to actual code — a file path, function name, config option, or test result. No speculative benefits.

**Anti-patterns:** Avoid "simple", "easy", "powerful" without evidence. Show simplicity through short examples, not adjectives.

### Feature List Formatting

For features sections in READMEs, two formats are available. Choose based on content:

**Bold+em-dash bullets** (recommended for 5+ features — more scannable):

```markdown
- **Feature name** — benefit description with evidence
- **Another feature** — another benefit with evidence
```

The bold text creates visual anchors, the em-dash cleanly separates "what" from "why", and each item gets breathing room. Use when feature descriptions vary in length or don't need structured comparison.

**Table with benefits column** (use for structured comparisons or when status tracking is needed):

```markdown
| Feature | Benefit | Status |
|---------|---------|--------|
| Feature A | Benefit description | :white_check_mark: Stable |
```

Use when features need status indicators, direct side-by-side comparison, or when the list is short (under 5 items).

**Rules for both formats:**
- Every feature must have evidence (file path, function, config option)
- Use at least 3 different benefit categories across the list
- Feature names should be concise (2-5 words) — put detail in the benefit text

## Marketing Principles for Technical Docs

- **Hero section**: Three-part structure — (1) bold one-liner explaining what it provides, (2) explanatory sentence covering scope and capabilities, (3) badges and platform compatibility line
- **Why section**: Frame features as solutions to real problems
- **Social proof**: Stars, downloads, contributors, "used by" logos where applicable
- **Competitive edge**: Subtle positioning vs alternatives (benchmark charts, comparison tables)
- **Call to action**: Every doc should end with a clear next step

## Visual Structure & Readability

Formatting choices affect scannability. These patterns are recommended for READMEs with 5+ sections or any document over 150 lines. Shorter documents can omit them.

### Emoji Heading Prefixes

Use a single emoji before each H2 heading to create visual anchors when scrolling. This helps readers scan a long document and locate sections quickly.

**Pattern:** `## {emoji} Section Title`

**Recommended emoji by section type:**

| Section Type | Emoji | Example |
|-------------|-------|---------|
| Quick start / Getting started | ⚡ | `## ⚡ Quick start` |
| Why / Value proposition | 💡 | `## 💡 Why ProjectName?` |
| Features | 🎯 | `## 🎯 Features` |
| Commands / API / Usage | 🤖 | `## 🤖 Commands` |
| Configuration | ⚙️ | `## ⚙️ Configuration` |
| Requirements / Prerequisites | 📦 | `## 📦 Requirements` |
| Documentation links | 📚 | `## 📚 Documentation` |
| Contributing | 🤝 | `## 🤝 Contributing` |
| Licence / License | 📄 | `## 📄 Licence` |
| Acknowledgements | 🙏 | `## 🙏 Acknowledgements` |
| Security | 🔒 | `## 🔒 Security` |
| Integrations / Plugins | 🔌 | `## 🔌 Integrations` |
| How it compares | ⚖️ | `## ⚖️ How it compares` |
| Roadmap | 🗺️ | `## 🗺️ Roadmap` |
| What it does / Use cases | 🚀 | `## 🚀 What ProjectName Does` |
| Cross-platform / Other tools | 🔀 | `## 🔀 Use with Other Tools` |

**Rules:**
- One emoji per heading — never two
- Use the same emoji consistently for the same section type across projects
- H3 sub-features within a Features section may also use emoji prefixes for visual grouping (`### 📡 Progress streaming`)
- Inline bullet emoji (`- 🎙️ **Voice notes**`) works for compact feature lists within a section
- Choose emoji that relate to the section content — decorative randomness hurts more than it helps
- Skip emoji prefixes for READMEs under 5 sections — the visual overhead outweighs the navigation benefit

### Horizontal Rules as Section Separators

Use `---` between major H2 sections to create visual breathing room. This is especially effective in long READMEs (200+ lines).

**When to use:**
- After the hero/badge section (before the first content section)
- After the table of contents
- Between each top-level H2 section
- Before the licence/footer

**When to skip:**
- Between H3 subsections within a single H2 section
- In short documents (under 150 lines) where they add more noise than clarity
- In files other than README.md (CONTRIBUTING, SECURITY, etc. are typically shorter)

### Table of Contents with Emoji Anchors

When a README uses emoji heading prefixes and has a table of contents, the anchor links must account for the emoji. GitHub strips the emoji character but retains the leading hyphen.

**Pattern:**
```markdown
## Table of contents

- [Quick start](#-quick-start)
- [Why ProjectName?](#-why-projectname)
- [Features](#-features)
- [Configuration](#%EF%B8%8F-configuration)
```

Include a TOC for READMEs with 7+ sections. Below 7 sections, the hero quick-links row (`[Docs](link) · [Examples](link) · [Discord](link)`) is sufficient.

### Bold Inline Callouts

For brief warnings, tips, and notes within a section, use bold inline callouts rather than GitHub-specific `[!NOTE]` syntax (which breaks on npm and PyPI).

**Pattern:**
```markdown
**Note:** This only applies when running in production mode.

**Tip:** Pass `--verbose` to see detailed output.

**Warning:** Never commit this file — it contains credentials.
```

Reserve GitHub callout syntax (`> [!NOTE]`, `> [!WARNING]`) for GitHub-only documents (issue templates, PR templates) where cross-renderer compatibility is not a concern.

## Shields.io Badges

Use these badge categories (in order):
1. Build/CI status
2. Test coverage
3. Package version / npm / PyPI
4. License
5. Downloads / usage metrics
6. Community (Discord, discussions)

Format: `[![Badge](https://img.shields.io/...)](link)`

## File Naming

- `README.md` — Always uppercase
- `CHANGELOG.md` — Always uppercase
- `ROADMAP.md` — Always uppercase
- `CONTRIBUTING.md` — Always uppercase
- `CODE_OF_CONDUCT.md` — Always uppercase with underscores
- `SECURITY.md` — Always uppercase
- `.github/ISSUE_TEMPLATE/` — GitHub convention
- `.github/PULL_REQUEST_TEMPLATE.md` — GitHub convention

## GEO: Writing for AI Citation

Generative Engine Optimisation (GEO) ensures documentation surfaces correctly in AI-generated answers — ChatGPT, Perplexity, Google AI Overviews, and Claude. These principles apply to all public-facing docs, not just READMEs.

### Crisp Definitions First

Put a one-sentence definition of the project at the very top of the README, before badges or navigation. LLMs preferentially quote top-of-page definitions when answering "what is X?" queries.

**Pattern:**
```markdown
# Project Name

**[One sentence that defines what this project is and who it's for.]**
```

The definition must be standalone — it should make sense if extracted from the page with no surrounding context.

### Atomic Sections

Each H2 section should have **one clear intent**, answerable as a standalone snippet. AI retrieval systems (RAG) chunk documents by heading, so a section that mixes installation with architecture reduces citation accuracy.

**Rules:**
- One topic per H2 — don't combine "Features" and "Configuration"
- Strict heading hierarchy: H1 > H2 > H3 without skipping levels (no H1 > H3)
- Descriptive headings that contain the topic keyword — "## TypeScript Configuration" not "## Config"
- Each section should be comprehensible without reading prior sections

### Concrete Statistics

Content with concrete statistics can boost visibility in AI responses by up to 28% (Aggarwal et al., "GEO: Generative Engine Optimization", 2023). Include benchmarks, performance numbers, percentages, and measurable outcomes wherever evidence exists.

**Pattern:**
```markdown
- Reduces bundle size by 40% compared to webpack (benchmark: `npm run bench`)
- Processes 10,000 records/second on a single worker (see `benchmarks/throughput.ts`)
- 95% test coverage across 200+ test cases (`npm test -- --coverage`)
```

**Rules:**
- Every statistic must trace to actual code, a benchmark file, or a verifiable measurement
- No speculative numbers — "blazingly fast" without evidence is worse than no claim at all
- Prefer relative comparisons ("40% faster than X") over absolute numbers when the alternative is well-known

### Comparison Tables

LLMs frequently surface comparison tables when answering "X vs Y" or "best X for Y" queries. Structure comparison sections to be extractable:

**Pattern:**
```markdown
## How It Compares

| Feature | This Project | Alternative A | Alternative B |
|---------|-------------|---------------|---------------|
| Specific feature | :white_check_mark: (with detail) | :x: | Partial |
```

**Rules:**
- Use a descriptive H2 heading: "How It Compares" or "How [Project] Compares to [Category]"
- Be factually accurate about competitors — false claims erode trust with both humans and AI
- Include at least one quantitative row (speed, bundle size, API count) alongside qualitative ones
- Link to sources for competitor claims where possible

### TL;DR and Key Concepts Blocks

For long guides (200+ lines), add a **TL;DR** or **Key Concepts** block immediately after the title. RAG systems often extract the first paragraph under a heading — make it count.

**Pattern:**
```markdown
# Migration Guide

> **TL;DR:** Upgrade from v1 to v2 by running `npx migrate` — the CLI handles config changes, dependency updates, and breaking API renames automatically. Manual steps are only needed for custom plugins.

## Prerequisites
...
```

### Prerequisite Blocks

Explicit, structured prerequisite blocks improve LLM understanding of dependencies and requirements. Always use a consistent format.

**Pattern:**
```markdown
## Prerequisites

- Node.js 20+ ([install guide](https://nodejs.org/))
- npm 10+ (included with Node.js)
- A GitHub account with repo access
```

Never bury prerequisites in prose paragraphs — AI extractors miss them.

### Cross-Referencing for Semantic Scaffolding

AI systems build understanding by following links between related documents. Explicit cross-references create a "semantic web" that improves citation accuracy across your documentation set.

**Rules:**
- Every guide links to at least one related guide and back to the hub page
- Use descriptive link text — `[Configuration Guide](docs/guides/configuration.md)` not `[click here](link)`
- README links to docs hub, docs hub links to individual guides, guides link back to README
- Changelog links to relevant documentation for breaking changes
