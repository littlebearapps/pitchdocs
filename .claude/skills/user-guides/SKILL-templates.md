# Diátaxis Document Templates

Companion file for the `user-guides` skill. Contains structural templates for the three Diátaxis types not covered in the main skill: **tutorial**, **reference**, and **explanation**. The main skill covers **how-to guides**.

Load this file when generating documents in these quadrants.

---

## Tutorial Template

Tutorials are **learning-oriented** — they guide a beginner through a complete experience to build confidence. The reader learns by doing, not by reading theory.

**Key principles:**
- The reader should achieve something **real** and **visible** by the end
- Every step must work — test the entire tutorial path before publishing
- Celebrate milestones ("You should now see..." followed by expected output)
- Explain the minimum necessary to keep moving; defer deep explanations to Explanation docs
- Never assume prior knowledge beyond the stated prerequisites

```markdown
---
title: "Build Your First [Thing]"
description: "A hands-on tutorial that walks you through [outcome] from scratch."
type: tutorial
difficulty: beginner
time_to_complete: "15 minutes"
related:
  - guides/getting-started.md
  - reference/cli.md
  - explanation/architecture.md
---

# Build Your First [Thing]

> **What you'll learn**: By the end of this tutorial, you'll have [concrete, visible outcome — e.g., "a working API that returns JSON from a D1 database"].

## Before You Start

**Prerequisites:**

- [Prerequisite 1] ([install guide](link))
- [Prerequisite 2]
- Completed the [Getting Started guide](../guides/getting-started.md)

**What we'll build:**

A brief description (2–3 sentences) of the end result — what it does, what it looks like, why it matters.

## Step 1: [Set Up the Foundation]

Brief explanation of what this step achieves (1–2 sentences).

\`\`\`bash
command here
\`\`\`

You should see:
\`\`\`
expected output
\`\`\`

## Step 2: [Add the Core Feature]

Brief explanation.

\`\`\`bash
command or code here
\`\`\`

You should see:
\`\`\`
expected output showing progress
\`\`\`

## Step 3: [Connect the Pieces]

Brief explanation.

\`\`\`bash
command or code here
\`\`\`

## Step 4: [Verify Everything Works]

Now let's confirm the full system works end-to-end.

\`\`\`bash
verification command
\`\`\`

You should see:
\`\`\`
expected success output showing the completed thing
\`\`\`

## What You Built

Recap what the reader accomplished (2–3 sentences). Reinforce the key concepts they used — but don't go deep. Link to Explanation docs for the "why".

## What's Next?

- **Extend it**: [Next tutorial](link) — add [next feature] to what you built
- **Understand it**: [Architecture explanation](../explanation/architecture.md) — why it's structured this way
- **Reference it**: [API Reference](../reference/api.md) — all options for the tools you used
- [Back to Docs Hub](../README.md)
```

**Tutorial anti-patterns:**
- Don't explain theory before the reader has done something — motivation comes from achievement
- Don't offer choices ("you could also use X") — tutorials have one path
- Don't skip verification steps — readers need to know they're on track
- Don't reference advanced features that aren't needed for this tutorial

---

## Reference Template

Reference docs are **information-oriented** — they describe the machinery. They are dry, complete, and accurate. The reader arrives knowing what they want to look up.

**Key principles:**
- **Completeness** is the primary virtue — every parameter, every option, every return type
- **Consistency** in structure — every item documented the same way
- **No narrative** — no "why", no opinions, no tutorials mixed in
- Use tables for structured data; use consistent column headings across all reference pages
- Link to relevant How-to Guides for "how do I use this?" questions

```markdown
---
title: "[Subject] Reference"
description: "Complete reference for all [subject] parameters, options, and return types."
type: reference
last_verified: "1.11.0"
related:
  - guides/getting-started.md
  - guides/configuration.md
---

# [Subject] Reference

> **Version**: This reference applies to v[X.Y]. See the [changelog](../../CHANGELOG.md) for version history.

## [Category 1]

### `command-or-function-name`

Brief description (one sentence).

| Parameter | Type | Default | Required | Description |
|-----------|------|---------|----------|-------------|
| `param1` | `string` | — | Yes | What this parameter controls |
| `param2` | `number` | `10` | No | What this parameter controls |
| `param3` | `boolean` | `false` | No | What this parameter controls |

**Returns:** `ReturnType` — description of return value.

**Example:**
\`\`\`bash
command --param1 "value" --param2 20
\`\`\`

---

### `another-command`

Brief description.

| Parameter | Type | Default | Required | Description |
|-----------|------|---------|----------|-------------|
| ... | ... | ... | ... | ... |

---

## [Category 2]

### `another-item`

...

---

## See Also

- [Getting Started Guide](../guides/getting-started.md) — how to use these commands in practice
- [Configuration Guide](../guides/configuration.md) — environment variables and config files
- [Back to Docs Hub](../README.md)
```

**Reference anti-patterns:**
- Don't mix "how to" instructions into reference — link to guides instead
- Don't omit parameters because they're "obvious" — reference must be complete
- Don't use inconsistent table columns across sections — pick a format and stick to it
- Don't include long prose explanations — one sentence per item, link to Explanation docs for depth

---

## Explanation Template

Explanation docs are **understanding-oriented** — they answer "why?" and connect concepts. The reader has already used the software and wants to understand the decisions behind it.

**Key principles:**
- **Context and reasoning** — explain the problem that led to this design
- **Trade-offs** — every design choice has alternatives; acknowledge them
- **No instructions** — don't tell the reader what to do (that's a guide), explain why things are the way they are
- Can include diagrams, analogies, and historical context
- Link to Reference docs for exact specifications; link to Guides for practical steps

```markdown
---
title: "Why [Project] Uses [Approach]"
description: "Design rationale behind [specific architecture decision or concept]."
type: explanation
related:
  - reference/api.md
  - guides/configuration.md
---

# Why [Project] Uses [Approach]

> **TL;DR**: [One-sentence summary of the design decision and its primary benefit.]

## The Problem

What situation or constraint led to this design? What were users experiencing? What technical limitation existed?

(2–3 paragraphs, concrete examples preferred over abstract descriptions)

## The Approach

How does [Project] solve this? What pattern, architecture, or technique was chosen?

(Describe the current design. Include a diagram if the architecture has 3+ interacting components.)

## Alternatives Considered

Why not [Alternative A]? Brief explanation of why it was ruled out.

Why not [Alternative B]? Brief explanation.

(Be fair to alternatives — acknowledge their strengths while explaining why they didn't fit this context.)

## Trade-offs

What did this approach cost? Every design choice has downsides:

- **Pro**: [Benefit of the chosen approach]
- **Pro**: [Another benefit]
- **Con**: [Downside or limitation]
- **Con**: [Another limitation]

## Further Reading

- **Reference**: [API Reference](../reference/api.md) — exact specifications of the system described here
- **Guide**: [Configuration Guide](../guides/configuration.md) — how to customise the behaviour discussed here
- **External**: [Relevant paper, blog post, or specification](link) — the original source for this pattern
- [Back to Docs Hub](../README.md)
```

**Explanation anti-patterns:**
- Don't include step-by-step instructions — that's a guide
- Don't list every parameter — that's a reference
- Don't be defensive about trade-offs — honest analysis builds trust
- Don't write an explanation for every minor implementation detail — only for decisions that users will wonder about
