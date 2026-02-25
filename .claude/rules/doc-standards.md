# Documentation Standards

When generating public-facing repository documentation, follow these principles:

## The 4-Question Test (Banesullivan Framework)

Every document must answer these questions for the reader:

1. **Does this solve my problem?** — Clear problem statement and value proposition in the first paragraph
2. **Can I use it?** — Installation, prerequisites, and quickstart within 30 seconds of reading
3. **Who made it?** — Credibility signals: author, contributors, badges, community size
4. **Where do I learn more?** — Links to docs, examples, community, and support channels

## Progressive Disclosure

- First paragraph: non-technical, benefit-focused, anyone can understand
- Second section: quick start for developers who want to try it NOW
- Deeper sections: technical details, API reference, architecture
- A familiar user should be able to refresh their memory without scrolling past the fold

## Tone & Language

- Consistent language — follow the project's existing locale and spelling conventions
- Professional-yet-approachable — confident, not corporate
- Benefit-driven: describe what users GAIN, not just what the software DOES
- "You can now..." not "We implemented..." — reader-centric framing
- Active voice. Short sentences. No jargon without explanation.

## Feature-to-Benefit Writing

Every feature mentioned in documentation must be translated into a user benefit.

**The pattern:**
```
[Technical feature] so you can [user outcome] — [evidence]
```

**Examples:**
- "Automatic changelog from git history **so you can** ship release notes in seconds — not hours"
- "TypeScript-first with strict mode **so you can** catch errors before they reach production"
- "14-file documentation audit **so you can** never ship a repo with missing docs again"

**5 benefit categories** — use at least 3 different categories across any features table:

| Category | User Feels | Pattern |
|----------|-----------|---------|
| Time saved | "That was fast" | "Do X in Y instead of Z" |
| Confidence gained | "I trust this" | "Know that X because Y" |
| Pain avoided | "I don't have to worry" | "Never worry about X again" |
| Capability unlocked | "Now I can do something new" | "Now you can X" |
| Cost reduced | "This saves me money/effort" | "One tool replaces N" |

**Evidence requirement:** Every benefit claim must trace to actual code — a file path, function name, config option, or test result. No speculative benefits.

**Anti-patterns:** Avoid "simple", "easy", "powerful" without evidence. Show simplicity through short examples, not adjectives.

## Marketing Principles for Technical Docs

- **Hero section**: Logo + compelling one-liner + badges = first impression
- **Why section**: Frame features as solutions to real problems
- **Social proof**: Stars, downloads, contributors, "used by" logos where applicable
- **Competitive edge**: Subtle positioning vs alternatives (benchmark charts, comparison tables)
- **Call to action**: Every doc should end with a clear next step

## Shields.io Badges

Use these badge categories (in order):
1. Build/CI status
2. Test coverage
3. Package version / npm / PyPI
4. License
5. Downloads / usage metrics
6. Community (Discord, discussions)

Format: `[![Badge](https://img.shields.io/...)](link)`

## File Naming

- `README.md` — Always uppercase
- `CHANGELOG.md` — Always uppercase
- `ROADMAP.md` — Always uppercase
- `CONTRIBUTING.md` — Always uppercase
- `CODE_OF_CONDUCT.md` — Always uppercase with underscores
- `SECURITY.md` — Always uppercase
- `.github/ISSUE_TEMPLATE/` — GitHub convention
- `.github/PULL_REQUEST_TEMPLATE.md` — GitHub convention
