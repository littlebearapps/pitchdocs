---
description: "Audit repository documentation completeness and quality: $ARGUMENTS"
argument-hint: "[project-path or 'fix' to auto-generate missing docs]"
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Write
  - Edit
  - mcp__github__get_file_contents
  - mcp__github__list_issues
  - mcp__github__list_releases
---

# /docs-audit

Check what public-facing documentation is missing or needs improvement.

## Behaviour

1. Load the `repo-docs-suite` skill for the complete inventory
2. Load the `doc-standards` rule for quality criteria
3. Scan the repository for all expected documentation files
4. Quality-check existing documents against the 4-question framework
5. Report findings with severity levels

## Audit Checklist

### Presence Check (Does the file exist?)

| Priority | File | Status |
|----------|------|--------|
| Critical | README.md | ? |
| Critical | LICENSE | ? |
| High | CONTRIBUTING.md | ? |
| High | .github/ISSUE_TEMPLATE/bug_report.yml | ? |
| High | .github/ISSUE_TEMPLATE/feature_request.yml | ? |
| High | .github/PULL_REQUEST_TEMPLATE.md | ? |
| Medium | CHANGELOG.md | ? |
| Medium | CODE_OF_CONDUCT.md | ? |
| Medium | SECURITY.md | ? |
| Medium | .github/ISSUE_TEMPLATE/config.yml | ? |
| Low | ROADMAP.md | ? |
| Low | .github/FUNDING.yml | ? |
| Low | docs/README.md | ? |
| Low | docs/guides/ | ? |

### Quality Check (Is the content good?)

For README.md:
- [ ] Has badges (build, coverage, version, license)
- [ ] First paragraph is non-technical and benefit-focused
- [ ] Has a quickstart section that works
- [ ] Has a features section with benefits
- [ ] Has contributing/community links
- [ ] Consistent spelling and language
- [ ] Links to user guides (if docs/guides/ exists)

For CONTRIBUTING.md:
- [ ] Matches actual dev workflow (correct commands)
- [ ] Includes prerequisites
- [ ] References conventional commits (if used)
- [ ] Links to issue templates

For CHANGELOG.md:
- [ ] Up to date with latest release
- [ ] Uses Keep a Changelog format
- [ ] Written in user-benefit language
- [ ] Has version comparison links

For docs/guides/:
- [ ] Hub page exists (docs/README.md)
- [ ] Getting started guide exists
- [ ] Guides are linked from README.md
- [ ] Each guide has verification steps

### Feature Coverage Check

Load the `feature-benefits` skill and scan the codebase for feature signals. Compare against README features section:

- [ ] Features table has a benefits column (not just feature names)
- [ ] All listed features have evidence (traceable to code)
- [ ] No major codebase features missing from README
- [ ] At least 3 different benefit categories used
- [ ] No over-documented claims (features listed but no code evidence)

Report format:
```
Feature Coverage: N documented / M detected (X%)

Missing from README:
  - [Feature] — found in [file]

Over-documented:
  - [Claimed feature] — no evidence found
```

## Output Format

```
📋 Documentation Audit: [project-name]

Score: 7/14 files present (50%)

✓ README.md — Present, good quality
✓ LICENSE — MIT
✗ CONTRIBUTING.md — Missing (High priority)
✗ CHANGELOG.md — Missing (Medium priority)
⚠ .github/ISSUE_TEMPLATE/ — Uses .md format, consider upgrading to YAML forms
✗ docs/guides/ — No user guides found

Quality Issues:
  README.md:
    ⚠ No badges found
    ⚠ First paragraph is too technical
    ✓ Quickstart section present
    ✗ No features table

Recommended actions (in priority order):
  1. Add CONTRIBUTING.md — run /readme to generate
  2. Add badges to README.md
  3. Rewrite README first paragraph for non-technical audience
  4. Create CHANGELOG.md — run /changelog full
  5. Create user guides in docs/guides/ — run /user-guide
```

## Arguments

- No arguments: runs audit and reports findings
- `fix`: runs audit AND auto-generates all missing files
- Path argument: audits a specific project directory

## When to Run

- Before making a repo public
- Before major releases
- After significant restructuring
- Periodically (quarterly) for maintenance
