---
description: "AI context file management has moved to ContextDocs: $ARGUMENTS"
argument-hint: "Install ContextDocs: /plugin install contextdocs@lba-plugins"
allowed-tools: []
---

# /ai-context — Moved to ContextDocs

AI context file management (AGENTS.md, CLAUDE.md, .cursorrules, copilot-instructions.md, .windsurfrules, .clinerules, GEMINI.md) has moved to the [ContextDocs](https://github.com/littlebearapps/contextdocs) plugin.

## Install ContextDocs

```bash
/plugin install contextdocs@lba-plugins
```

## Then Use

```bash
/contextdocs:ai-context              # Generate all context files
/contextdocs:ai-context init         # Bootstrap a new project
/contextdocs:ai-context update       # Patch only what drifted
/contextdocs:ai-context promote      # Promote MEMORY.md patterns to CLAUDE.md
/contextdocs:ai-context audit        # Check for staleness and drift
```

ContextDocs uses the same Signal Gate principle and all the same features — it's the same skill, now in its own focused plugin.
