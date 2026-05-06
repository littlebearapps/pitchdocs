---
name: visual-standards
description: Visual formatting standards for repository documentation — emoji heading prefixes, horizontal rules, TOC anchors, callouts, screenshots (device dimensions, HTML patterns, captions, shadows), and image optimisation. Load when generating READMEs with visual elements or working with screenshots.
argument-hint: "[topic: 'screenshots', 'emoji', 'captions', or general]"
allowed-tools: Read Glob Grep
version: "1.0.0"
---

# Visual Standards

## Invocation

Load visual formatting reference for emoji heading prefixes, horizontal rules, TOC anchors, callouts, screenshot dimensions, HTML patterns, captions, shadows, and image optimisation.

**Use when:**
- Adding screenshots or demo GIFs to a README
- Setting up emoji heading prefixes for a long README
- Checking device-specific capture dimensions
- Working with captions, shadows, or image annotations

## Emoji Heading Prefixes

Use a single emoji before each H2 heading to create visual anchors when scrolling.

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
| Security | 🔒 | `## 🔒 Security` |
| Integrations / Plugins | 🔌 | `## 🔌 Integrations` |
| How it compares | ⚖️ | `## ⚖️ How it compares` |
| Roadmap | 🗺️ | `## 🗺️ Roadmap` |
| What it does / Use cases | 🚀 | `## 🚀 What ProjectName Does` |

**Rules:**
- One emoji per heading — never two
- Use the same emoji consistently for the same section type across projects
- Skip emoji prefixes for READMEs under 5 sections

## Horizontal Rules as Section Separators

Use `---` between major H2 sections to create visual breathing room (especially in 200+ line READMEs).

**When to use:** After hero/badge section, after TOC, between H2 sections, before licence/footer.
**When to skip:** Between H3 subsections, in short documents (under 150 lines), in non-README files.

## Table of Contents with Emoji Anchors

GitHub and GitLab strip the emoji character but retain the leading hyphen. Bitbucket prefixes all heading anchors with `markdown-header-` — load the `platform-profiles` skill when targeting Bitbucket.

```markdown
- [Quick start](#-quick-start)
- [Why ProjectName?](#-why-projectname)
- [Features](#-features)
- [Configuration](#%EF%B8%8F-configuration)
```

Include a TOC for READMEs with 7+ sections.

## Bold Inline Callouts

For brief warnings, tips, and notes, use bold inline callouts rather than GitHub-specific `[!NOTE]` syntax (which breaks on npm and PyPI).

```markdown
**Note:** This only applies when running in production mode.
**Tip:** Pass `--verbose` to see detailed output.
**Warning:** Never commit this file — it contains credentials.
```

Reserve GitHub callout syntax for GitHub-only documents (issue templates, PR templates).

## Screenshots & Device Images

For device-specific capture dimensions, HTML display patterns, retina handling, annotation conventions, captions, shadows/borders, browser chrome, file naming, and optimisation guidance, load `SKILL-reference.md` from this skill directory.

## Diagrams (Mermaid)

Mermaid renders natively on GitHub and GitLab; npm and PyPI strip it. For multi-renderer READMEs, **pre-render to SVG/PNG and reference the static asset** — the Mermaid source can live alongside in `docs/diagrams/` for editability.

| Diagram type | When to use |
|--------------|-------------|
| `flowchart` | Decision trees, control flow, data pipelines |
| `sequenceDiagram` | API call traces, request/response timing |
| `classDiagram` | Type relationships, ORM mappings |
| `stateDiagram-v2` | State machines, lifecycle docs |
| `gitGraph` | Branch strategy / release flow visualisation |
| `wardleyMap` | Strategy diagrams — capability evolution from genesis → custom → product → commodity (Mermaid 11+) |

**Styling:** Mermaid 2026's "neo look" refresh applies cleaner defaults to flowchart, class, sequence, state, and gitGraph diagrams. To opt into the new defaults explicitly, set `%%{init: {"look": "neo"}}%%` at the top of the diagram block. To keep the classic look across versions, use `"look": "classic"`.

**GitHub theme handling:** GitHub auto-syncs the Mermaid theme to dark mode **only when no `%%{init}%%` theme is set**. If you pin a theme, light/dark mode users see the same colours — verify both in preview before merging.
