# Use PitchDocs with Other AI Tools

PitchDocs is built as a Claude Code plugin, but the documentation knowledge it contains — skills, agent workflows, quality standards — is stored as plain Markdown files with YAML frontmatter. That makes it portable to other AI coding tools with minimal effort.

## What's Inside

The source of truth lives in `.claude/`. Here's what each piece does:

| Directory | Contents | Purpose | Cross-Tool? |
|-----------|----------|---------|-------------|
| `.claude/skills/*/SKILL.md` | 14 skill files | Reference knowledge for all doc types plus context guard installation | Yes — Claude Code, OpenCode, Codex CLI |
| `.claude/agents/docs-writer.md` | 1 agent file | Orchestration workflow: codebase scanning → feature extraction → doc writing → validation | Partial — Claude Code, OpenCode (may vary) |
| `.claude/rules/doc-standards.md` | 1 rule file | Quality standards: 4-question framework, GEO optimisation, progressive disclosure, benefit-driven language | **Claude Code only** |
| `.claude/rules/context-quality.md` | 1 rule file | AI context file quality standards: cross-file consistency, path verification, sync points | **Claude Code only** |
| `commands/*.md` | 12 command files | Slash command definitions for all PitchDocs commands | Yes — Claude Code, OpenCode |
| `hooks/*.sh` | 2 hook scripts | Post-commit drift detection and structural change reminders for AI context files | **Claude Code only** |

## Tool Compatibility Summary

Not all PitchDocs features work in every tool. Here's what's portable and what's Claude Code-specific:

| Feature | Claude Code | OpenCode | Codex CLI | Cursor / Windsurf / Cline / Gemini CLI |
|---------|------------|----------|-----------|----------------------------------------|
| Skills (14 SKILL.md files) | Native | Native (`.claude/skills/` fallback) | Copy to `.agents/skills/` | Reference on demand |
| Slash commands (12) | Native | Native (`.claude/commands/` fallback) | Copy to prompts | Not supported |
| Docs-writer agent | Native | Likely supported | Reference manually | Cursor: `.cursor/agents/` |
| Doc-standards rule | Auto-loaded | Not supported | Not supported | Cursor: `.cursor/rules/` |
| Context-quality rule | Auto-loaded | Not supported | Not supported | Not supported |
| Context Guard hooks | Native (opt-in) | Not supported | Not supported | Not supported |
| AGENTS.md | Loaded | Primary context file | Primary context file | Not used |
| CLAUDE.md | Loaded | Fallback (if no AGENTS.md) | Not used | Not used |

---

## OpenCode

[OpenCode](https://opencode.ai/) reads `.claude/skills/` natively — PitchDocs works out of the box with no extra setup.

**Install** the same way as Claude Code (clone or add as a plugin), then invoke skills by name in your OpenCode session. The 13 SKILL.md files, the docs-writer agent, and the doc-standards rule are all picked up automatically.

OpenCode also supports MCP servers, so if you have the GitHub MCP server configured, the docs-writer agent can access repository metadata, issues, and releases just as it does in Claude Code.

---

## Codex CLI

[Codex CLI](https://codex.openai.com/) (OpenAI) uses the same SKILL.md format as Claude Code but looks for skills at a different path: `.agents/skills/` instead of `.claude/skills/`.

**Step 1 — Copy skills into your project:**

```bash
# From your project root (not the PitchDocs repo)
PITCHDOCS="/path/to/pitchdocs"

# Copy all 13 skills
cp -r "$PITCHDOCS/.claude/skills/"* .agents/skills/

# Copy the quality standards as AGENTS.md (Codex reads this automatically)
cp "$PITCHDOCS/AGENTS.md" ./AGENTS.md
```

**Step 2 — Use the skills:**

Codex CLI loads SKILL.md files automatically when they're in `.agents/skills/`. Ask it to generate documentation and it will have access to the PitchDocs frameworks:

```
> Generate a marketing-friendly README for this project using the public-readme skill
> Extract features and benefits from this codebase using the feature-benefits skill
```

**Step 3 (optional) — Add slash commands:**

Copy PitchDocs command files into your Codex prompts directory to get `/prompts:readme`, `/prompts:changelog`, etc.:

```bash
cp "$PITCHDOCS/commands/"*.md ~/.codex/prompts/pitchdocs/
```

---

## Cursor

[Cursor](https://cursor.com/) uses `.cursor/rules/*.mdc` files for contextual rules and `.cursor/agents/*.md` for subagents. It doesn't read SKILL.md files, but you can adapt PitchDocs content to Cursor's format.

**Step 1 — Add the documentation standards as a Cursor rule:**

Create `.cursor/rules/doc-standards.mdc` in your project:

```
---
description: PitchDocs documentation quality standards — 4-question framework, benefit-driven language, progressive disclosure, marketing-friendly structure
---

(Paste the contents of .claude/rules/doc-standards.md here, without its YAML frontmatter)
```

Because this rule has a `description` but no `globs` or `alwaysApply`, Cursor treats it as an **agent-selected rule** — it gets included automatically when the AI determines it's relevant to your request.

**Step 2 — Add the docs-writer agent:**

Create `.cursor/agents/docs-writer.md` in your project:

```
---
name: docs-writer
description: Generates high-quality public-facing repository documentation with marketing appeal
---

(Paste the contents of .claude/agents/docs-writer.md here, without its YAML frontmatter)
```

**Step 3 — Reference skills on demand:**

Cursor doesn't have a skills directory, but you can reference PitchDocs skill files directly. Clone the PitchDocs repo somewhere accessible, then ask Cursor:

```
> Read the file at /path/to/pitchdocs/.claude/skills/public-readme/SKILL.md and use it to generate a README for this project
```

Or paste specific skill content into additional `.cursor/rules/*.mdc` files for the skills you use most often.

---

## Windsurf

[Windsurf](https://codeium.com/windsurf) (by Codeium) uses `.windsurfrules` for project-level context. Its Cascade AI reads this file from the project root automatically.

**Step 1 — Add the documentation standards:**

Create `.windsurfrules` in your project root:

```bash
# Copy the doc-standards rule as Windsurf context
cp /path/to/pitchdocs/.claude/rules/doc-standards.md .windsurfrules
```

Or use `/ai-context windsurf` in Claude Code to generate a tailored `.windsurfrules` from your codebase analysis.

**Step 2 — Reference skills on demand:**

Windsurf can read files from your workspace. Ask Cascade to load specific skill files:

```
> Read /path/to/pitchdocs/.claude/skills/public-readme/SKILL.md and use it to generate a README for this project
```

---

## Cline

[Cline](https://github.com/cline/cline) (VS Code extension) uses `.clinerules` for project-level context. It supports richer Markdown with task checklists.

**Step 1 — Add the documentation standards:**

Create `.clinerules` in your project root:

```bash
# Copy the doc-standards rule as Cline context
cp /path/to/pitchdocs/.claude/rules/doc-standards.md .clinerules
```

Or use `/ai-context cline` in Claude Code to generate a tailored `.clinerules` from your codebase analysis.

**Step 2 — Reference skills on demand:**

Cline can read files from your workspace. Reference PitchDocs skill files directly in your Cline session:

```
Read /path/to/pitchdocs/.claude/skills/public-readme/SKILL.md and use it to generate a README for this project
```

---

## Gemini CLI

[Gemini CLI](https://github.com/google-gemini/gemini-cli) uses `GEMINI.md` for project context and `.gemini/commands/*.toml` for custom commands. It doesn't read SKILL.md files directly, but the knowledge transfers easily.

**Option A — Quick setup (context file):**

Copy the documentation standards into your project's Gemini context:

```bash
# Create .gemini/ directory
mkdir -p .gemini

# Use the doc-standards rule as your base context
cp /path/to/pitchdocs/.claude/rules/doc-standards.md .gemini/GEMINI.md
```

Then ask Gemini to read specific skill files when needed:

```
> Read /path/to/pitchdocs/.claude/skills/public-readme/SKILL.md and use it to generate a README
```

**Option B — Custom commands (TOML):**

For frequently used workflows, create TOML command files. For example, `.gemini/commands/readme.toml`:

```toml
description = "Generate a marketing-friendly README using PitchDocs standards"
prompt = """
Read the PitchDocs public-readme skill at /path/to/pitchdocs/.claude/skills/public-readme/SKILL.md
and the feature-benefits skill at /path/to/pitchdocs/.claude/skills/feature-benefits/SKILL.md.

Then analyse this codebase and generate a README.md following the skill instructions.
Use the 4-question framework, progressive disclosure, and benefit-driven language.
"""
```

This gives you a `/readme` command in Gemini CLI.

---

## Aider

[Aider](https://aider.chat/) doesn't have a plugin or skill system, but it can load reference files into its context via the `read` config option.

**Add to `.aider.conf.yml` in your project:**

```yaml
read:
  - /path/to/pitchdocs/.claude/rules/doc-standards.md
```

This loads the documentation quality standards into every Aider session. For specific tasks, load skill files directly in chat:

```
/read /path/to/pitchdocs/.claude/skills/public-readme/SKILL.md
Generate a README for this project following the skill instructions.
```

---

## Goose

[Goose](https://github.com/block/goose) (by Block) uses `.goosehints` for project context and MCP servers for tool access.

**Add PitchDocs context to `.goosehints`:**

```bash
# Append the doc-standards rule to your project hints
cat /path/to/pitchdocs/.claude/rules/doc-standards.md >> .goosehints
```

For specific documentation tasks, reference skill files in your Goose session. If you have the GitHub MCP server configured, Goose can access repository metadata just as Claude Code does.
