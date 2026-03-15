# Hacker News "Show HN" Post

## Title (80 char limit)
```
Show HN: PitchDocs – Generate production-grade docs from any codebase
```

## First Comment

Hi HN,

I built PitchDocs to solve a problem I kept running into: shipping code without documentation. Every project meant rewriting the same README sections, CHANGELOG entries, contributing guides — and by release day, half the docs were already out of date.

PitchDocs is a Claude Code plugin (100% Markdown, zero runtime dependencies) that scans your codebase and auto-generates a complete documentation suite. It's not a simple README generator — it extracts features from 10 signal categories (exports, CLI commands, API routes, npm scripts, etc.), maps every claim back to actual code, and generates evidence-based docs that follow professional standards (the 4-question test, the lobby principle, Time to Hello World).

What sets it apart from other tools: instead of guessing what your project does, it *reads your actual code* and surfaces the features users care about. Every feature claim is backed by a file path. The docs are GEO-optimised for AI citation (ChatGPT, Perplexity, Google AI Overviews cite your project accurately). Quality scores (0–100) grade completeness, structure, freshness, and evidence quality. Six GitHub Actions checks catch documentation decay before merge.

Built with: 100% Markdown skills, runs on Claude Code, OpenCode, Codex CLI, Cursor, Windsurf, Cline, Gemini CLI, Aider, Goose. No build step, no runtime dependencies.

Key features:
- Evidence-based feature extraction from code (10 signal categories, file-level evidence)
- Full docs suite from one command: README, CHANGELOG, ROADMAP, CONTRIBUTING, SECURITY, guides, issue templates, llms.txt
- Professional standards baked in (4-question test, lobby principle, Time to Hello World)
- GEO-optimised for AI discoverability and accurate citation
- Quality scoring (0–100) with CI integration (`--min-score` to block undocumented features)
- Per-project opt-in advisory features (doc standards, freshness checking, awareness nudges)
- GitHub, GitLab, Bitbucket support

[GitHub](https://github.com/littlebearapps/pitchdocs) | [Docs](https://github.com/littlebearapps/pitchdocs/tree/main/docs)

Happy to answer questions about evidence-based documentation, feature extraction from code, or the 4-question framework. We're also planning multi-language support and enhanced feature extraction in upcoming releases.

---

**Posting window recommendation:** Tuesday–Thursday, 9–11 AM US Eastern (14:00–16:00 UTC). Academic research on 138 repo launches showed +121 stars within 24 hours of HN exposure at these times.

**Avoid:** Weekends, US holidays, major tech conference days, high-traffic posting hours (concurrent with product launches or major news cycles).
