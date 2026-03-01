# Getting Started with PitchDocs

This guide walks you through installing PitchDocs, generating your first README, and exploring the full command set.

**Time to Hello World:** Under 60 seconds for your first README. Full walkthrough below: ~5 minutes.

**Prerequisites:**

- [Claude Code](https://code.claude.com/) or [OpenCode](https://opencode.ai/) installed
- A project repository you want to document

> **Using a different AI tool?** PitchDocs also works with Codex CLI, Cursor, Windsurf, Cline, Gemini CLI, Aider, and Goose. See [Use with Other AI Tools](../../README.md#-use-with-other-ai-tools) for setup instructions.

---

## 1. Install PitchDocs

Open Claude Code in your terminal and run:

```bash
# Add the LBA plugin marketplace (once per machine)
/plugin marketplace add littlebearapps/lba-plugins

# Install PitchDocs
/plugin install pitchdocs@lba-plugins
```

**Verify it worked:** The skills and commands are loaded automatically. You should see PitchDocs skills available when you start a new session.

---

## 2. Generate Your First README

Navigate to the project you want to document, then run:

```bash
/readme
```

PitchDocs will:
1. Scan your codebase (manifest files, project structure, git history)
2. Extract features with file-level evidence across 10 signal categories
3. Translate features into benefit-driven language
4. Generate a README.md with a hero section, quick start, features table, and proper badges

**Tip:** If a README.md already exists, PitchDocs reads it first and improves it rather than overwriting from scratch.

---

## 3. Audit Your Documentation

Check what other docs your project needs:

```bash
/docs-audit
```

This scans your repo against a 20+ file checklist across 3 priority tiers and reports what's missing. To auto-generate everything that's missing in one go:

```bash
/docs-audit fix
```

---

## 4. Extract Features

See what PitchDocs detects in your codebase:

```bash
# Full feature inventory with evidence
/features

# Output as a benefits table for your README
/features table

# Output as bold+em-dash bullets
/features bullets

# Audit: compare what's documented vs what's in the code
/features audit
```

---

## 5. Generate Individual Docs

Use any command on its own for specific doc types:

```bash
/changelog          # CHANGELOG.md from git history
/roadmap            # ROADMAP.md from GitHub milestones
/user-guide         # User guides in docs/guides/
/llms-txt           # llms.txt for AI discoverability
/ai-context         # AGENTS.md, CLAUDE.md, .cursorrules, copilot-instructions.md, .windsurfrules, .clinerules, GEMINI.md
/docs-verify        # Validate links, freshness, and consistency
/launch             # Dev.to articles, HN posts, Reddit posts, Twitter threads
```

---

## 6. Verify Everything

Before shipping your docs, run the verification suite:

```bash
/docs-verify
```

This checks for:
- Broken internal and external links (with case-sensitivity and fragment validation)
- Stale content (files not updated in 90+ days)
- llms.txt sync (all referenced files exist)
- Heading hierarchy issues (no level skipping)
- Badge URL validity
- Security issues (leaked credentials, internal paths, internal hostnames)
- Quality score (0–100 across 5 dimensions with A–F grade bands)
- Token budget compliance (skill files within size targets)

---

## What's Next?

- **Improve your README further** — Run `/readme` again with specific focus areas (e.g., `/readme focus on the comparison table`)
- **Check your quality score** — Run `/docs-verify score` to get a numeric rating and actionable suggestions for improvement
- **Set up CI verification** — The `/docs-verify` command outputs CI-friendly results for GitHub Actions
- **Launch your project** — Run `/launch` to generate Dev.to articles, Hacker News posts, and awesome list submissions
- **Explore skills** — Each command loads specialised reference knowledge. See the [Skills section](../../README.md#-skills) for the full inventory.

---

**Need help?** See [SUPPORT.md](../../SUPPORT.md) for getting help, common questions, and contact details.
