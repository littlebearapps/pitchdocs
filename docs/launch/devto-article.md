---
title: "PitchDocs: Ship Production-Grade Docs With One Command"
published: false
description: "Turn any codebase into professional, marketing-ready repository documentation powered by AI. Works with 9 AI tools, GitHub/GitLab/Bitbucket."
tags: [documentation, devtools, opensource, ai]
canonical_url: https://github.com/littlebearapps/pitchdocs
---

Your repo has incredible code. But when someone lands on GitHub, all they see is... nothing. No README that explains what this does. No CHANGELOG that makes sense to users. No contributing guide. No security policy.

By the time you'd finished writing all that documentation, you could've shipped three features. And half of it would already be out of date.

## The Problem With Manual Documentation

Writing great documentation is a slog. Even if you *know* the patterns (the 4-question test, the lobby principle, Time to Hello World), every new project means starting from scratch. You're writing the same sections over and over — installation instructions, feature tables, API overviews. And then six months later, when you ship v2.0, the docs are still referencing v1.0.

Tools like readmeai give you a README. Generators make READMEs from package.json. But neither handles the *full suite* — CHANGELOG, CONTRIBUTING, ROADMAP, SECURITY, issue templates, user guides, API docs, `llms.txt` for AI discoverability.

And none of them understand your codebase well enough to surface the features users actually care about.

## Enter PitchDocs

PitchDocs is a Claude Code plugin (100% Markdown, zero runtime dependencies) that turns your codebase into a complete documentation suite — all from slash commands.

Scan your code for features. Extract user benefits with evidence. Generate a README that sells. Create a CHANGELOG that users understand. Build contributing guides, roadmaps, security policies — all in one go or one command at a time.

### What It Actually Does

```bash
/pitchdocs:readme          # Marketing-friendly README in 60 seconds
/pitchdocs:features        # Extract features + benefits from code
/pitchdocs:changelog       # User-focused CHANGELOG from git history
/pitchdocs:roadmap         # ROADMAP from GitHub milestones
/pitchdocs:docs-audit fix  # Auto-generate missing docs (20+ files)
```

No configuration. No build step. Works with Claude Code, OpenCode, Codex CLI, Cursor, Windsurf, Cline, Gemini CLI, Aider, and Goose.

### The Secret: Evidence-Based Features

PitchDocs doesn't guess what your project does. It scans 10 signal categories — exports, CLI commands, API routes, npm scripts, configuration options, schema definitions, and more — then maps features to actual file paths.

Every feature claim is backed by code. When PitchDocs says "You can configure X via Y", it shows you the exact file where that lives.

### Built-In Professional Standards

Every generated doc passes three quality gates:

1. **The 4-Question Test** — Does it solve my problem? Can I use it? Who made it? Where do I learn more?
2. **The Lobby Principle** — README is the lobby, not the entire building. Deep content goes in docs/guides/
3. **Time to Hello World** — Installation, prerequisites, and a working example within 30 seconds of reading

No "leveraging" or "in today's digital landscape". No generic AI fluff. Just clear, benefit-driven writing.

### GEO-Optimised for AI

When ChatGPT, Perplexity, or Google AI Overviews search your docs, they find structured, cited content. Your project gets cited accurately in AI-generated answers.

### Quality Scoring & CI Integration

Every command includes a quality score (0–100). Six GitHub Actions checks are built in: spell check, frontmatter validation, llms.txt consistency, banned phrase detection, orphan file detection, token budget enforcement.

### One Plugin, 9 AI Tools

The same skill library works with Claude Code, OpenCode, Codex CLI, Cursor, Windsurf, Cline, Gemini CLI, Aider, and Goose — all knowledge is stored in plain Markdown.

## Getting Started

```bash
/plugin marketplace add littlebearapps/lba-plugins
/plugin install pitchdocs@lba-plugins
/pitchdocs:readme
```

Want advisory features?

```bash
/pitchdocs:activate install
```

## What's New in v2.1.0

- Per-project activation for advisory features
- Activation eval suite (21 test scenarios, 80%+ target)
- Plugin review fixes (version sync, hook exit codes)

---

PitchDocs is open source (MIT) — made by [Little Bear Apps](https://littlebearapps.com). **Try it now:** `/pitchdocs:readme`
