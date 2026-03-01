---
name: feature-benefits
description: Systematic codebase scanning for features and evidence-based feature-to-benefit translation. Extracts what a project does from its code and translates it into what users gain. Use when generating README features tables, auditing feature coverage, or building benefit-driven documentation.
version: "1.0.0"
---

# Feature-Benefits Extraction

Scan a codebase systematically, extract concrete features with evidence, classify by impact, and translate into benefit-driven language for documentation.

## 5-Step Feature Extraction Workflow

### Step 1: Detect Project Type

Read the primary manifest to understand the ecosystem:

| File | Ecosystem | Key Fields |
|------|-----------|------------|
| `package.json` | Node.js / JavaScript / TypeScript | `dependencies`, `scripts`, `bin`, `exports`, `type` |
| `pyproject.toml` | Python | `[project.dependencies]`, `[project.scripts]`, `[tool.*]` |
| `Cargo.toml` | Rust | `[dependencies]`, `[features]`, `[[bin]]` |
| `go.mod` | Go | `require`, module path |
| `.claude-plugin/plugin.json` | Claude Code Plugin | `skills`, `commands`, `agents`, `hooks` |

Also check: `Makefile`, `Dockerfile`, `docker-compose.yml`, `.github/workflows/`, `wrangler.toml` for deployment signals.

### Step 2: Scan Signal Categories

For each category, check the listed file patterns. Read matching files and record what you find.

#### 2.1 CLI Commands
- `bin/` directory, `package.json#bin`, `[project.scripts]`
- `src/cli*`, `src/commands/`, `cmd/`
- **What to record**: command names, flags, subcommands

#### 2.2 Public API
- `src/index.*`, `lib/index.*`, `exports` in manifest
- `src/api/`, `routes/`, `handlers/`
- TypeScript: `.d.ts` files, `export` statements
- Python: `__init__.py`, `__all__`
- **What to record**: exported functions/classes, parameter types, return types

#### 2.3 Configuration
- Config files: `*.config.js`, `*.config.ts`, `.rc` files
- Schema files: JSON Schema, Zod schemas, Pydantic models
- Environment: `.env.example`, `wrangler.toml`
- **What to record**: config options, defaults, validation

#### 2.4 Integrations
- Dependencies in manifest (group by purpose: HTTP, database, auth, etc.)
- MCP servers (`.mcp.json`), plugin systems
- Webhook handlers, event listeners
- **What to record**: what external systems it connects to

#### 2.5 Performance
- Caching: Redis, Memcached, in-memory cache implementations
- Async/concurrent: worker threads, async patterns, queue systems
- Benchmarks: `bench/`, `benchmark/`, performance tests
- **What to record**: performance claims with evidence (benchmark results, cache strategies)

#### 2.6 Security
- Auth: OAuth, JWT, API keys, session management
- Validation: input sanitisation, schema validation
- Encryption, CORS, CSP, rate limiting
- **What to record**: security features with implementation location

#### 2.7 TypeScript / Developer Experience
- Type safety: strict mode, no `any`, generics
- Code generation, auto-completion support
- Error messages, debug utilities
- **What to record**: DX features that save developer time

#### 2.8 Testing
- Test files: `*.test.*`, `*.spec.*`, `test/`, `tests/`
- Coverage config, CI test steps
- E2E tests, integration tests
- **What to record**: test coverage %, test types present

#### 2.9 Middleware / Plugins / Extensibility
- Plugin system, middleware chain, hook system
- Extension points, event emitters
- **What to record**: extensibility mechanisms and what they enable

#### 2.10 Documentation
- `docs/`, `examples/`, API docs generation
- JSDoc/docstrings coverage
- **What to record**: documentation completeness

### Step 3: Extract Concrete Features with Evidence

For each signal found, create a feature entry:

```
Feature: [What it does — concrete, specific]
Evidence: [File path, function name, or config that proves it]
Category: [Signal category from Step 2]
```

**Rules:**
- Every feature must have a file path or function as evidence
- No speculative features — if you can't point to code, it's not a feature
- Be specific: "Zero-config TypeScript support" not "Good developer experience"

### Step 3.5: Map to Jobs-to-be-Done

For richer benefit writing, identify the job each feature is hired to do before translating to a benefit sentence. JTBD adds an input lens for understanding *why* a feature matters — the 5 benefit categories remain the output classification.

For each extracted feature, frame the job:

```
When I am [situation/context],
I want [capability this feature provides],
so I can [desired outcome].
```

Classify each job:
- **Functional** — the practical task ("deploy to production", "generate a changelog")
- **Emotional** — how the user wants to feel ("confident my docs are complete")
- **Social** — how the user wants to be perceived ("my repo looks professional")

**When to apply:**

| Impact Tier | JTBD Depth | Rationale |
|-------------|-----------|-----------|
| **Hero** (1–3) | Recommended — all three job types | Hero features drive adoption; emotional and social jobs sharpen the "why switch?" narrative |
| **Core** (4–8) | Functional job only | Core features need clear practical framing but don't need emotional/social depth |
| **Supporting** (9+) | Skip | Supporting features are nice-to-haves — the 5 benefit categories suffice |

**Rules:**
- For projects with fewer than 5 features, skip JTBD — the 5 benefit categories suffice
- JTBD informs the benefit sentence — the final output still uses the `[Feature] so you can [outcome] — [evidence]` pattern

### Step 4: Classify by Impact Tier

| Tier | Count | Criteria | README Placement |
|------|-------|----------|-----------------|
| **Hero** | 1–3 | Primary differentiators. Why someone chooses THIS over alternatives. | One-liner, Why section, first in features table |
| **Core** | 4–8 | Expected by the target audience. Missing these would be a deal-breaker. | Features table, quick start examples |
| **Supporting** | 9+ | Nice-to-have. Adds polish but isn't the reason someone adopts. | Mentioned briefly or linked to docs |

**Classification questions:**
- Would a user switch from an alternative for this feature? → Hero
- Would a user leave if this feature were missing? → Core
- Does this feature delight but isn't essential? → Supporting

### Step 5: Output Structured Feature Inventory

```markdown
## Feature Inventory: [Project Name]

### Hero Features (1–3)
| Feature | Evidence | Benefit Category | JTBD (optional) |
|---------|----------|-----------------|-----------------|
| ... | `src/...` | Time saved | Functional: ... |

### Core Features (4–8)
| Feature | Evidence | Benefit Category | JTBD (optional) |
|---------|----------|-----------------|-----------------|
| ... | `src/...` | Confidence gained | |

### Supporting Features
| Feature | Evidence | Benefit Category | JTBD (optional) |
|---------|----------|-----------------|-----------------|
| ... | `src/...` | Pain avoided | |
```

### Alternative Output: Emoji+Bold+Em-Dash Bullets

For direct use in a README features section (especially with 5+ features), output as emoji+bold+em-dash bullets instead of a table. The emoji creates a visual anchor per item, making long lists scannable at a glance:

```markdown
- 🔍 **Feature name** — benefit description with evidence
- 📋 **Another feature** — benefit description with evidence
```

Choose an emoji that relates to the feature content — not decorative randomness. Use this format when the `/features bullets` command is invoked, or when the feature list has 5+ items and doesn't need status tracking or side-by-side comparison.

---

## Feature-to-Benefit Translation Framework

Features describe what code does. Benefits describe what users gain. Every feature in documentation must be translated into a benefit.

### The Translation Pattern

```
[Technical feature] so you can [user outcome] — [evidence]
```

**Examples:**
- "Automatic changelog from git history **so you can** ship release notes in seconds — not hours"
- "TypeScript-first with strict mode **so you can** catch errors before they reach production"
- "Zero-config defaults with full override support **so you can** start fast and customise later"

### 5 Benefit Categories

JTBD mapping (Step 3.5) enriches benefit writing by identifying the underlying job before choosing a category — the job's desired outcome often points directly to the right category.

Use at least 3 different categories across your features table to avoid monotone docs.

| Category | Pattern | Example Benefit |
|----------|---------|----------------|
| **Time saved** | "Do X in Y instead of Z" | "Generate a full README in under a minute — not an afternoon" |
| **Confidence gained** | "Know that X because Y" | "Every benefit traces to actual code — no marketing fluff" |
| **Pain avoided** | "Never worry about X" | "Never ship a repo with missing docs again" |
| **Capability unlocked** | "Now you can X" | "Scan any codebase and extract its selling points automatically" |
| **Cost reduced** | "Save X by Y" | "One plugin replaces five separate documentation tools" |

### Translation Table by Signal Category

| Signal Category | Feature Pattern | Benefit Translation |
|-----------------|----------------|-------------------|
| CLI commands | "CLI with N subcommands" | "Do everything from your terminal — no context switching" |
| Public API | "N exported functions with types" | "Import what you need — fully typed, tree-shakeable" |
| Configuration | "N config options with defaults" | "Works out of the box — customise only what you need" |
| Integrations | "Connects to X, Y, Z" | "Fits into your existing stack — not a rewrite" |
| Performance | "Benchmarks at N ops/sec" | "Fast enough that you'll never wait for it" |
| Security | "Built-in auth + validation" | "Security built in — not bolted on" |
| TypeScript/DX | "Strict types, no `any`" | "Your editor knows the API — autocomplete everywhere" |
| Testing | "N% test coverage" | "Battle-tested — every edge case covered" |
| Middleware/Plugins | "Plugin system with N hooks" | "Extend it your way — no forking required" |
| Documentation | "Guides, examples, API docs" | "Answers without reading source code" |

### Mapping Benefits to Badges

When a benefit claim maps to a verifiable metric (test coverage, bundle size, download count), load the `package-registry` skill for badge templates that make the claim visible in the README hero. Badges turn prose claims into at-a-glance proof.

### Anti-Patterns

- **No "simple" or "easy"** — show simplicity through a short code example instead
- **No "powerful" without evidence** — what specifically makes it powerful?
- **No speculative benefits** — "could save you hours" requires evidence of what it replaces
- **No feature-as-benefit** — "Has caching" is a feature, not a benefit. "Responses in <50ms after first request" is the benefit
- **No superlatives without proof** — "fastest", "best", "most complete" need benchmarks or comparisons

---

## Common Patterns Library

Quick-reference scanning hints per ecosystem.

### Node.js / TypeScript
- `package.json#exports` → public API surface
- `tsconfig.json#strict` → type safety level
- `vitest.config.*` or `jest.config.*` → testing setup
- `src/index.ts` exports → main feature set
- `bin/` or `package.json#bin` → CLI tools

### Python
- `pyproject.toml#[project.scripts]` → CLI entry points
- `__init__.py#__all__` → public API
- `conftest.py` → testing infrastructure
- `alembic/` or `migrations/` → database layer
- `Dockerfile` + `gunicorn`/`uvicorn` → production-ready server

### Go
- `cmd/` directory → CLI tools
- `pkg/` or exported functions → public API
- `internal/` → private implementation (not features)
- `go.sum` size → dependency footprint
- `Makefile` targets → developer workflows

### Rust
- `Cargo.toml#[features]` → optional feature flags
- `src/lib.rs` public items → API surface
- `benches/` → performance evidence
- `examples/` → usage patterns
- `#[derive()]` usage → ergonomics

### Claude Code Plugin (Markdown)
- `commands/` → slash commands (user-facing features)
- `.claude/skills/` → reference knowledge (capabilities)
- `.claude/agents/` → autonomous workflows
- `.claude/rules/` → quality standards
- `hooks/` → automated checks
