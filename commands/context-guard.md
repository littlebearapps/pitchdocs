---
description: "Context Guard hooks have moved to ContextDocs: $ARGUMENTS"
argument-hint: "Install ContextDocs: /plugin install contextdocs@lba-plugins"
allowed-tools: []
---

# /context-guard — Moved to ContextDocs

Context Guard hooks for AI context file freshness have moved to the [ContextDocs](https://github.com/littlebearapps/contextdocs) plugin.

## Install ContextDocs

```bash
/plugin install contextdocs@lba-plugins
```

## Then Use

```bash
/contextdocs:context-guard install          # Tier 1 — Nudge (session-end reminder)
/contextdocs:context-guard install strict   # Tier 1 + Tier 2 (commit blocking)
/contextdocs:context-guard uninstall        # Remove all hooks
/contextdocs:context-guard status           # Check installation state and drift
```

Context Guard includes the same two-tier enforcement, content filter protection, and Untether compatibility — now in its own focused plugin.
