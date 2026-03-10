---
title: "PitchDocs with Untether"
description: "Context Guard hooks have moved to ContextDocs. This page redirects to the new location."
type: explanation
difficulty: beginner
last_verified: "2.0.0"
related:
  - guides/getting-started.md
  - guides/workflows.md
order: 8
---

# PitchDocs with Untether

Context Guard hooks and AI context file management have moved to [ContextDocs](https://github.com/littlebearapps/contextdocs).

All other PitchDocs commands (README generation, changelog, features, docs-audit, docs-verify, launch artifacts, etc.) work identically in [Untether](https://github.com/littlebearapps/untether) sessions — no configuration needed.

For Context Guard's Untether-aware session-end nudge behaviour, see the ContextDocs documentation after installing:

```
/plugin install contextdocs@lba-plugins
/contextdocs:context-guard install
```
