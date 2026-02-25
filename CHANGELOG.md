# Changelog

All notable changes to this project are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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

[Unreleased]: https://github.com/littlebearapps/repo-docs-plugin/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/littlebearapps/repo-docs-plugin/releases/tag/v1.0.0
