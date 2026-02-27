---
name: package-registry
description: Documentation guidance for projects published to npm and PyPI package registries. Covers metadata fields that affect registry pages, README cross-renderer compatibility, trusted publishing, provenance badges, and audit checks. Use when a project has package.json or pyproject.toml and is published publicly.
version: "1.0.0"
---

# Package Registry Documentation Guidance

## When This Applies

These checks are **conditional** — only run when the project is published to a package registry.

| File Present | Registry | Action |
|-------------|----------|--------|
| `package.json` | npm (npmjs.com) | Check npm metadata fields, badge templates |
| `pyproject.toml` | PyPI (pypi.org) | Check PyPI metadata fields, Markdown compatibility |
| Both | npm + PyPI | Check both; cross-renderer compatibility is critical |

Detection:
```bash
[ -f "package.json" ] && echo "npm project detected"
[ -f "pyproject.toml" ] && echo "PyPI project detected"
```

## npm Registry Metadata

The README displayed on npmjs.com comes from the **published tarball**, not live from GitHub. Changes to your README on GitHub do not update the npm page until you publish a new version.

### package.json Fields That Affect the npm Page

| Field | Affects | Priority | Notes |
|-------|---------|----------|-------|
| `name` | Package name in header and URL | Required | Scoped (`@org/name`) preferred for organisations |
| `version` | Version display, install command | Required | Must follow semver |
| `description` | Search results, package header | High | First ~200 chars shown in search; match README value proposition |
| `keywords` | npm search discovery | High | Array of strings, aim for 5–10 relevant terms |
| `homepage` | "Homepage" sidebar link | High | Docs site or project page |
| `repository` | "Repository" sidebar link, GitHub integration | High | Must be `{ "type": "git", "url": "git+https://github.com/org/repo.git" }` |
| `bugs` | "Issues" sidebar link | Medium | `{ "url": "https://github.com/org/repo/issues" }` |
| `license` | Licence badge in sidebar | High | SPDX identifier string (e.g., `"MIT"`, `"Apache-2.0"`) |
| `author` | Displayed on package page | Medium | `{ "name": "...", "email": "...", "url": "..." }` |
| `funding` | "Fund this package" button | Low | URL string or `{ "type": "github", "url": "..." }` |
| `types` / `typings` | TypeScript indicator (TS badge) | High (for TS) | Path to `.d.ts` file; npm won't show TS badge without explicit field |
| `files` | What gets published in tarball | High | Whitelist approach preferred; README/LICENSE/CHANGELOG always included |

**Critical for trusted publishing:** `repository.url` must **exactly match** the GitHub repository URL (case-sensitive) for npm OIDC trusted publishing to work.

### npm Always-Included Files

Regardless of the `files` field or `.npmignore`, npm always includes:
- `package.json`
- `README` (any case, any extension)
- `LICENSE` / `LICENCE` (any case, any extension)
- `CHANGELOG` (any case, any extension)
- The file referenced by `main`

Use `npm pack` to inspect tarball contents before publishing.

## PyPI Registry Metadata

### pyproject.toml Fields That Affect the PyPI Page

| Field | Section | Affects | Notes |
|-------|---------|---------|-------|
| `name` | `[project]` | Package name and URL | PEP 503 normalisation (hyphens = underscores) |
| `version` | `[project]` | Version display | Or dynamic via build backend |
| `description` | `[project]` | Search results summary | Single line, plain text |
| `readme` | `[project]` | Full description on project page | `"README.md"` or `{ file = "README.md", content-type = "text/markdown" }` |
| `license` | `[project]` | Licence display | PEP 639: SPDX expression preferred (`"MIT"`, `"Apache-2.0 OR MIT"`) |
| `requires-python` | `[project]` | Python version badge | `">=3.10"` |
| `keywords` | `[project]` | Search discovery | Array of strings |
| `classifiers` | `[project]` | Category browsing on PyPI | Trove classifiers (still relevant for non-licence metadata) |
| `urls` | `[project.urls]` | Sidebar links with custom icons | Use well-known labels below |

### Well-Known PyPI URL Labels

PyPI recognises specific URL labels and displays them with **custom icons** instead of generic links. Labels are normalised (punctuation/whitespace removed, lowercased).

| Label | Icon | Example URL |
|-------|------|-------------|
| `Homepage` | House | `https://project.com` |
| `Repository` or `Source` | Code | `https://github.com/org/repo` |
| `Documentation` or `Docs` | Book | `https://docs.project.com` |
| `Changelog` or `Changes` | List | `https://github.com/org/repo/blob/main/CHANGELOG.md` |
| `Issues` or `Bug Tracker` | Bug | `https://github.com/org/repo/issues` |
| `Funding` or `Sponsor` | Heart | `https://github.com/sponsors/org` |
| `Download` | Download | `https://github.com/org/repo/releases` |

Example:
```toml
[project.urls]
Homepage = "https://project.com"
Repository = "https://github.com/org/repo"
Documentation = "https://docs.project.com"
Changelog = "https://github.com/org/repo/blob/main/CHANGELOG.md"
Issues = "https://github.com/org/repo/issues"
```

### PEP 639: SPDX Licence Expressions

The new standard for licence metadata in Python. Replaces trove classifier licence identifiers.

**New approach (recommended):**
```toml
[project]
license = "MIT"              # SPDX expression
license-files = ["LICENSE"]  # Explicit file paths
```

**Old approach (deprecated):**
```toml
[project]
license = {text = "MIT License"}
```

SPDX expressions are more precise than trove classifiers (e.g., distinguishes BSD-2-Clause from BSD-3-Clause).

### Verified vs Unverified Details

PyPI's sidebar splits project information into two sections:
- **Verified details** (green checkmark): URLs verified through Trusted Publisher. GitHub statistics (stars, forks) only shown here.
- **Unverified details**: URLs and metadata that cannot be automatically verified.

Configuring a Trusted Publisher automatically verifies the repository URL.

## README Cross-Renderer Compatibility

READMEs render on multiple platforms. What works on GitHub may break on npm or PyPI.

| Markdown Feature | GitHub | npm | PyPI | Workaround |
|-----------------|--------|-----|------|------------|
| Heading anchors (`#section`) | Yes | Yes | **No** | Use full URLs to GitHub README |
| Relative images (`./docs/img.png`) | Yes | **No** | **No** | Use absolute `raw.githubusercontent.com` URLs |
| GitHub callouts (`[!NOTE]`) | Yes | **No** | **No** | Use bold text or blockquotes |
| `<details>`/`<summary>` | Yes | Yes | **Unreliable** | Avoid for critical content |
| `colspan`/`rowspan` in tables | Partial | Partial | **No** | Use simpler table structures |
| `<div align="center">` | Yes | Yes | **No** | Acceptable loss; PyPI strips most HTML alignment |
| Mermaid diagrams | Yes | **No** | **No** | Use pre-rendered SVG/PNG images |
| Task lists (`- [ ]`) | Yes | Yes | **No** | Use bullet lists with emoji checkmarks |
| Footnotes | Yes | **No** | **No** | Use inline parenthetical notes |

### Key Rules for Multi-Renderer READMEs

1. **Always use absolute URLs for images** — relative paths break on both npm and PyPI
2. **Avoid GitHub-specific callouts** (`[!NOTE]`, `[!WARNING]`) — plain text elsewhere
3. **Avoid heading anchor links** if PyPI rendering matters — broken on PyPI
4. **Avoid `<details>`/`<summary>`** for critical content — unreliable on PyPI
5. **Test before publishing**: `twine check dist/*` validates PyPI README rendering

### Solving GitHub vs PyPI Differences

For Python projects needing optimised READMEs on both platforms, consider `hatch-fancy-pypi-readme`:
- Assembles PyPI READMEs from fragments
- Runs regex substitutions to transform GitHub-specific content
- Converts relative links to absolute links

## Trusted Publishing and Provenance

This section covers documentation-relevant aspects. The plugin does NOT create publish workflows (that's DevOps).

### npm Trusted Publishing

- **OIDC trusted publishing went GA July 2025** — replaces long-lived tokens entirely
- Classic tokens permanently revoked December 2025; granular tokens max 90 days
- Publishing with `--provenance` flag adds a **Sigstore badge** on npmjs.com linking to the exact source commit and build workflow
- Requires `id-token: write` permission in GitHub Actions
- `repository.url` in package.json must exactly match the GitHub repo URL (case-sensitive)

### PyPI Trusted Publishing

- **Trusted Publisher since April 2023** — first major registry to support OIDC
- **Digital attestations (PEP 740) since November 2024** — Sigstore signing for package files
- "Verified details" sidebar badge appears automatically when trusted publisher is configured
- Repository URL in `[project.urls]` must match the GitHub repo for verification
- `pypa/gh-action-pypi-publish` handles publishing when configured as a trusted publisher

### What to Audit (Not Configure)

- Check if `repository.url` (npm) or `[project.urls].Repository` (PyPI) matches the actual GitHub repo URL
- Flag opportunity to add provenance/attestation badges to README if not present
- Link to trusted publishing setup docs in audit output

## Registry-Specific Badges

### npm Badges

```markdown
[![npm version](https://img.shields.io/npm/v/PACKAGE-NAME)](https://www.npmjs.com/package/PACKAGE-NAME)
[![npm downloads](https://img.shields.io/npm/dm/PACKAGE-NAME)](https://www.npmjs.com/package/PACKAGE-NAME)
[![npm bundle size](https://img.shields.io/bundlephobia/minzip/PACKAGE-NAME)](https://bundlephobia.com/package/PACKAGE-NAME)
[![types](https://img.shields.io/npm/types/PACKAGE-NAME)](https://www.npmjs.com/package/PACKAGE-NAME)
```

### PyPI Badges

```markdown
[![PyPI version](https://img.shields.io/pypi/v/PACKAGE-NAME)](https://pypi.org/project/PACKAGE-NAME/)
[![Python versions](https://img.shields.io/pypi/pyversions/PACKAGE-NAME)](https://pypi.org/project/PACKAGE-NAME/)
[![PyPI downloads](https://img.shields.io/pypi/dm/PACKAGE-NAME)](https://pypi.org/project/PACKAGE-NAME/)
[![PyPI status](https://img.shields.io/pypi/status/PACKAGE-NAME)](https://pypi.org/project/PACKAGE-NAME/)
```

Badge order (after CI/coverage badges):
1. Registry version (npm or PyPI)
2. Downloads
3. Type support (npm types) or Python versions (PyPI)
4. Bundle size (npm only) or status (PyPI only)

## Audit Checklist

### npm Project (package.json exists)

- [ ] `description` present and matches README value proposition
- [ ] `keywords` present with at least 3 relevant entries
- [ ] `repository` present with correct URL format (`{ "type": "git", "url": "git+https://..." }`)
- [ ] `homepage` present (docs site, project page, or npm page)
- [ ] `bugs` present (GitHub issues URL)
- [ ] `license` present and matches LICENSE file (SPDX identifier)
- [ ] `types` or `typings` present if TypeScript project (check for tsconfig.json)
- [ ] `files` whitelist present (preferred over .npmignore)
- [ ] `author` or `contributors` present
- [ ] `funding` present (if sponsorship available)
- [ ] README avoids npm-incompatible Markdown (relative images, Mermaid, footnotes)

### PyPI Project (pyproject.toml exists)

- [ ] `[project].description` present and non-empty
- [ ] `[project].readme` points to README.md with correct content-type
- [ ] `[project].keywords` present with at least 3 entries
- [ ] `[project].license` present (SPDX expression preferred per PEP 639)
- [ ] `[project].requires-python` present
- [ ] `[project.urls]` has at least Homepage, Repository, and Issues (using well-known labels)
- [ ] `[project].classifiers` includes relevant trove classifiers (development status, language, topic)
- [ ] `[project].authors` or `[project].maintainers` present
- [ ] README avoids PyPI-incompatible Markdown (heading anchors, relative images, callouts, details/summary)
