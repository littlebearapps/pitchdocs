# Reddit Launch Templates

## r/programming

**Title:** PitchDocs: Generate production-grade docs from any codebase

**URL:** https://github.com/littlebearapps/pitchdocs

**First Comment (author context):**

Author here. I built PitchDocs because shipping code without documentation was killing productivity. Every project meant rewriting the same README sections, CHANGELOG entries, guides — and half would be stale by release time.

The key insight: instead of guessing what your codebase does, *scan the actual code*. Extract features from exports, CLI commands, API routes, npm scripts, config options, schema definitions — then map every feature back to file paths. Evidence-based.

Technical highlights:
- Codebase analysis: 10 signal categories, intelligent feature extraction, persona inference
- Evidence mapping: every feature claim includes file path + line context
- Professional standards: 4-question test, lobby principle, Time to Hello World metrics, banned phrase detection
- GEO-optimized: atomic sections, comparison tables, llms.txt for AI citation accuracy
- Quality framework: 0–100 scoring (completeness, structure, freshness, evidence), 6 GitHub Actions checks

Built entirely with plain Markdown (100% framework/language agnostic). Works with Claude Code, OpenCode, Codex CLI, Cursor, Windsurf, Cline, Gemini CLI, Aider, Goose.

Interested in feedback on the evidence-mapping approach and cross-platform compatibility. Very open to contributions on the feature extraction heuristics and quality scoring model.

---

## r/webdev

**Title:** I built PitchDocs to stop rewriting the same docs for every project — open source

**Body:**

Every web project I shipped came with the same doc problem: README, CHANGELOG, CONTRIBUTING, ROADMAP, SECURITY, user guides — all needing to be written from scratch, all going stale the moment you ship the next feature.

I built **PitchDocs** to fix this. It's a Claude Code plugin that scans your codebase and auto-generates a complete documentation suite.

**What makes it different:**
- Reads actual code (not just package.json or file counts) — extracts features from exports, CLI commands, routes, npm scripts, config options
- Evidence-based — every feature claim includes the exact file path
- Professional quality — all docs follow the 4-question test, lobby principle, and measurable Time to Hello World
- One command generates the full suite: README (with quickstart + comparison table), CHANGELOG (from git history), ROADMAP (from GitHub milestones), guides, contributing, security policy, llms.txt
- GEO-optimised — ChatGPT and Perplexity cite your project accurately
- Quality scoring (0–100) — grades completeness, structure, freshness, and evidence quality

**The practical bit:** You get your first generated README in under 60 seconds. Then choose which other docs to auto-generate. Works with Claude Code, OpenCode, and 7 other AI tools.

Used it on a dozen projects now — saves *hours* on every release cycle.

[GitHub](https://github.com/littlebearapps/pitchdocs) | [Docs](https://github.com/littlebearapps/pitchdocs/tree/main/docs) | [Quick start](https://github.com/littlebearapps/pitchdocs?tab=readme-ov-file#-get-started)

Feedback welcome, especially from folks who've struggled with keeping docs in sync with code.

---

## r/opensource

**Title:** PitchDocs – AI-powered docs generator for any codebase [open source, MIT]

**Body:**

Launched PitchDocs (v2.1.0) — a Claude Code plugin for generating professional repository documentation from code.

**What it does:**
- Scans your codebase for features (10 signal categories)
- Extracts user benefits with evidence (every claim backed by file path)
- Generates: README, CHANGELOG, ROADMAP, CONTRIBUTING, SECURITY, user guides, issue templates, llms.txt
- All docs follow professional standards (4-question test, lobby principle, Time to Hello World)
- Quality scored (0–100) with CI integration

**Why it matters for open source:**
- Documentation is often the barrier to adoption — this lowers that friction significantly
- Quality scoring helps you catch undocumented features before merge
- GEO-optimised output means AI systems cite your project accurately
- Works across GitHub, GitLab, Bitbucket

**Tech:** 100% Markdown (no build, no runtime), compatible with 9 AI tools (Claude Code, OpenCode, Cursor, Codex, Gemini CLI, Windsurf, Cline, Aider, Goose).

**What's coming:** Multi-language documentation, enhanced feature extraction, platform-specific threat modeling.

**Contribute:** Good first issues include improving feature extraction heuristics, adding new doc templates, and cross-platform testing.

[GitHub](https://github.com/littlebearapps/pitchdocs) | [Milestones](https://github.com/littlebearapps/pitchdocs/milestones) | [Contributing](https://github.com/littlebearapps/pitchdocs/blob/main/CONTRIBUTING.md)

---

**Reddit posting strategy:**
- Post to r/programming first (Tuesday–Thursday, 2–4 PM EST)
- Space r/webdev post by 24+ hours
- Space r/opensource post by another 24+ hours
- Engage genuinely in comment threads — this is not a hit-and-run announcement
- Check each subreddit's rules before posting (some have self-promotion policies)
