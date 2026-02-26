# Changelog

All notable changes to this project are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.5.0](https://github.com/littlebearapps/pitchdocs/compare/v1.4.1...v1.5.0) (2026-02-26)

### Added

- **GEO (Generative Engine Optimisation)** — new section in `doc-standards` rule with crisp definitions, atomic sections, concrete statistics, comparison tables, TL;DR blocks, and cross-referencing patterns structured for LLM citation
- **GEO patterns in `public-readme` skill** — first-paragraph-as-definition guidance, comparison table optimisation for "X vs Y" queries, and semantic heading hierarchy enforcement
- **Diataxis framework** in `user-guides` skill — classify docs into tutorials, how-to guides, reference, and explanation quadrants with updated directory layout
- **`ai-context` skill and `/ai-context` command** — generate AGENTS.md, CLAUDE.md, .cursorrules, and .github/copilot-instructions.md from codebase analysis with staleness audit mode
- **`docs-verify` skill and `/docs-verify` command** — validate broken links, stale content (90-day threshold via git blame), llms.txt sync, heading hierarchy, image alt text, badge URLs, and feature coverage with CI-friendly output
- **`launch-artifacts` skill and `/launch` command** — transform README/CHANGELOG into Dev.to articles, Hacker News "Show HN" posts, Reddit posts, Twitter/X threads, awesome list submission PRs, and social preview image guidance
- **`api-reference` skill** — configuration templates and comment conventions for TypeDoc, Sphinx/mkdocstrings, godoc, and rustdoc with language auto-detection
- **AI context files in `pitchdocs-suite` inventory** — AGENTS.md and copilot-instructions.md at Tier 2, CLAUDE.md and .cursorrules at Tier 3
- **Diataxis coverage check in `/docs-audit`** — flags missing documentation quadrants
- **AI context staleness check in `/docs-audit`** — verifies context files match current codebase
- **Documentation verification check in `/docs-audit`** — recommends `/docs-verify` for comprehensive validation
- **Enhanced user guide patterns** — copy-paste-ready code examples, error recovery with collapsible troubleshooting, video/screencast placement guidance, and Diataxis cross-links
- **GitHub Actions docs CI template** — markdownlint + lychee link checking workflow in `docs-verify` skill

### Changed

- `pitchdocs-suite` audit scan now checks for AGENTS.md, CLAUDE.md, .cursorrules, and copilot-instructions.md
- `docs-writer` agent now references 4 additional skills (ai-context, docs-verify, launch-artifacts, api-reference)
- Docs inventory expanded from 17+ to 20+ files across all tiers
- Plugin version bumped to 1.5.0 with new keywords (seo, geo, ai-context, agents-md, diataxis)

## [1.4.1](https://github.com/littlebearapps/pitchdocs/compare/v1.4.0...v1.4.1) (2026-02-26)


### Fixed

* add content filter mitigations and visual formatting guidance ([0e89233](https://github.com/littlebearapps/pitchdocs/commit/0e892334fd1ef42d63d2327a95bbe833236ab003))
* add missing colour to version badge in README ([92a679c](https://github.com/littlebearapps/pitchdocs/commit/92a679c2001a92c70d6096fdc49bab1a740ca741))
* use query-param badge URL so release-please preserves colour ([f39c1f0](https://github.com/littlebearapps/pitchdocs/commit/f39c1f02a543c709444f1e38dafc2f5209bd53a2))

## [1.4.0](https://github.com/littlebearapps/pitchdocs/compare/v1.3.0...v1.4.0) (2026-02-25)


### Added

* rename plugin from repo-docs to PitchDocs ([6843e3f](https://github.com/littlebearapps/pitchdocs/commit/6843e3f86b3d9601a509a77a5f975ecf4714150f))

## [1.3.0](https://github.com/littlebearapps/pitchdocs/compare/v1.2.0...v1.3.0) (2026-02-25)


### Added

* add npm and PyPI package registry documentation guidance ([38540d4](https://github.com/littlebearapps/pitchdocs/commit/38540d4ff1aad7136628d9689535d85730668751))
* add release-please automated versioning ([562b0c1](https://github.com/littlebearapps/pitchdocs/commit/562b0c186d305e1734e263077e279a756ebadf33))

## [1.2.0] - 2026-02-25

### Added

- `llms-txt` skill — llmstxt.org specification reference with generation patterns for repos and docs sites
- `/llms-txt` command — generate llms.txt and llms-full.txt for LLM-friendly content curation
- LICENSE selection framework with decision guidance in `repo-docs-suite` skill
- Visual assets guidance — storage locations, formats, naming conventions, alt text requirements
- Social preview image audit check (1280×640, Settings reminder)
- SUPPORT.md template in `repo-docs-suite` Tier 2
- `.github/release.yml` template for auto-generated GitHub Release notes
- CITATION.cff template (conditional, Tier 3) for academic/research projects
- llms.txt, SUPPORT.md, release.yml, and CITATION.cff presence checks in `/docs-audit`
- Visual assets presence check in `/docs-audit`
- GitHub repository metadata checks in `/docs-audit` — topics, website URL, and description
- Topic suggestion framework in `repo-docs-suite` skill based on project type, language, and ecosystem
- Repository metadata step in `docs-writer` agent workflow
- Validation checklist additions in `docs-writer` agent — visual elements, LICENSE match, social preview, llms.txt

## [1.1.0] - 2026-02-25

### Added

- `feature-benefits` skill — systematic codebase scanning for features with evidence-based benefit translation
- `/features` command — standalone feature extraction with inventory, table, and audit modes
- Feature coverage check in `/docs-audit` — detects undocumented and over-documented features
- Feature-to-Benefit writing principles in `doc-standards` rule

### Changed

- `docs-writer` agent Step 2 now uses the 5-step Feature Extraction Workflow instead of vague bullet points
- `/readme` command loads `feature-benefits` skill and verifies evidence-based features
- `public-readme` skill includes guidance on populating features tables from codebase scans

## [1.0.0] - 2026-02-25

### Added

- `/readme` command — generate marketing-friendly READMEs with the Daytona/Banesullivan 4-question framework
- `/changelog` command — generate changelogs from git history with user-benefit language
- `/roadmap` command — generate roadmaps from GitHub milestones and issues
- `/docs-audit` command — audit documentation completeness across 14 file types
- `/user-guide` command — generate task-oriented user guides in `docs/guides/`
- `public-readme` skill — README structure with hero section, benefit-driven features, and comparison tables
- `changelog` skill — Keep a Changelog format with language transformation rules
- `roadmap` skill — Roadmap structure from GitHub Projects with emoji status indicators
- `repo-docs-suite` skill — complete repo docs inventory with templates for CONTRIBUTING, CODE_OF_CONDUCT, SECURITY, and GitHub templates
- `user-guides` skill — task-oriented how-to documentation with hub page and cross-linking
- `docs-writer` agent — long-form documentation generation with codebase analysis
- `doc-standards` rule — tone, language, badges, and the 4-question framework
- Monthly upstream spec drift detection via GitHub Actions
- Upstream version tracking for Keep a Changelog, Contributor Covenant, Conventional Commits, and Semantic Versioning

[1.2.0]: https://github.com/littlebearapps/pitchdocs/compare/v1.1.0...v1.2.0
[1.1.0]: https://github.com/littlebearapps/pitchdocs/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/littlebearapps/pitchdocs/releases/tag/v1.0.0
