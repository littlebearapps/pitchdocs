---
name: docs-verify
description: Validates documentation quality and freshness — checks for broken links, stale content, llms.txt sync, image issues, heading hierarchy, and badge URLs. Runs locally or in CI. Use to catch documentation decay before it reaches users.
version: "1.0.0"
---

# Documentation Verifier

## Philosophy

Generating documentation is a solved problem. **Preventing documentation decay** is not. This skill validates that generated docs remain accurate, linked, and fresh over time.

## Verification Checks

### 1. Markdown Lint

Check heading hierarchy and structural consistency across all documentation files.

```bash
# Find all documentation Markdown files
find . -name "*.md" -not -path "./.git/*" -not -path "./node_modules/*" | sort
```

For each file, verify:

- **Heading hierarchy** — H1 > H2 > H3 without skipping levels (no H1 > H3). Critical for RAG chunking and GEO.
- **Single H1** — Only one H1 per document (the title)
- **Consistent formatting** — No trailing whitespace, consistent list markers, blank lines around headings
- **No bare URLs** — Links should use `[text](url)` format, not raw URLs in prose

Report format:
```
Markdown Lint:
  ✓ README.md — 0 issues
  ⚠ docs/guides/configuration.md:45 — heading level skipped (H2 → H4)
  ⚠ CONTRIBUTING.md:23 — trailing whitespace
```

### 2. Link Validation

Check all internal and external links in documentation files.

**Internal links (relative paths and anchors):**

```bash
# Extract relative links from Markdown files
grep -roE '\[([^\]]*)\]\(([^)]+)\)' docs/ README.md CONTRIBUTING.md CHANGELOG.md 2>/dev/null
```

For each relative link:
- Verify the target file exists on disk
- Verify anchor links (`#section-name`) match an actual heading in the target file
- Check for case-sensitivity issues (common on Linux, invisible on macOS)

**External links (URLs):**

For each external URL found in documentation:
- Check HTTP status code (200 OK, 301 redirect, 404 not found)
- Timeout after 10 seconds per URL
- Skip URLs behind authentication (GitHub private repos, paywalled content)
- Flag any 404s or 5xx errors

Report format:
```
Link Validation:
  Checked: 45 links (32 internal, 13 external)
  ✓ 42 valid
  ✗ README.md:89 — docs/guides/migration.md (file not found)
  ✗ CONTRIBUTING.md:34 — #setup-instructions (anchor not found, did you mean #development-setup?)
  ⚠ README.md:12 — https://example.com/old-docs (301 redirect → https://example.com/docs)
```

### 3. llms.txt Sync Check

Verify that `llms.txt` references match actual files on disk.

```bash
# Extract file paths from llms.txt
grep -oE '\./[^ ]+\.md' llms.txt 2>/dev/null | while read -r path; do
  [ -f "$path" ] && echo "✓ $path" || echo "✗ $path (file not found)"
done
```

Also check:
- Every Markdown file in the repo is represented in llms.txt (no orphaned docs)
- Descriptions in llms.txt match the actual file content (first paragraph check)
- llms-full.txt (if present) is not stale — compare modification time against source files

Report format:
```
llms.txt Sync:
  ✓ 12/12 referenced files exist
  ⚠ docs/guides/deployment.md not listed in llms.txt (orphaned doc)
  ⚠ llms-full.txt is 14 days older than README.md — may need regeneration
```

### 4. Image Validation

Check that all referenced images exist and are properly formatted.

```bash
# Extract image references from Markdown files
grep -roE '!\[([^\]]*)\]\(([^)]+)\)' docs/ README.md 2>/dev/null
```

For each image reference:
- **File exists** — Verify the image file is on disk (for relative paths)
- **Alt text present** — Flag images with empty alt text (`![]()`)
- **Absolute URLs for registries** — If the project is published to npm/PyPI, images must use absolute URLs (`https://raw.githubusercontent.com/...`), not relative paths
- **File size** — Flag images over 1MB (GitHub has a 10MB file limit, but large images slow page load)

Report format:
```
Image Validation:
  ✓ docs/images/demo.gif — exists, alt text: "Quick start demo", 2.3MB
  ⚠ docs/images/architecture.svg — empty alt text
  ✗ README.md:15 — assets/screenshot.png (file not found)
  ⚠ README.md:15 — relative image path, will break on npm (use absolute URL)
```

### 5. Freshness Check

Flag documentation files that haven't been updated recently. Uses `git log` to check the last modification date.

```bash
# Check last modification date for each doc file
for f in README.md CONTRIBUTING.md CHANGELOG.md docs/guides/*.md; do
  if [ -f "$f" ]; then
    last_modified=$(git log -1 --format="%ci" -- "$f" 2>/dev/null)
    echo "$f: $last_modified"
  fi
done
```

**Staleness thresholds (configurable):**

| File | Warning | Stale |
|------|---------|-------|
| README.md | 90 days | 180 days |
| CHANGELOG.md | 30 days (if releases exist) | 90 days |
| CONTRIBUTING.md | 180 days | 365 days |
| docs/guides/*.md | 90 days | 180 days |
| SECURITY.md | 180 days | 365 days |

Compare against latest commit date, not calendar date — a dormant project with no commits shouldn't trigger freshness warnings.

Report format:
```
Freshness Check:
  ✓ README.md — updated 12 days ago
  ⚠ docs/guides/deployment.md — last updated 95 days ago (threshold: 90 days)
  ✗ CONTRIBUTING.md — last updated 14 months ago (stale)
  · CHANGELOG.md — 2 releases since last update (v1.3.0, v1.4.0)
```

### 6. Feature Coverage Sync

Compare features mentioned in README against actual code. Reuses the `feature-benefits` skill's extraction workflow.

1. Load `feature-benefits` skill and run the feature extraction
2. Parse README.md features section for listed features
3. Cross-reference:
   - **Undocumented features** — code evidence exists, but not in README
   - **Over-documented features** — claimed in README, but no code evidence

Report format:
```
Feature Coverage: 8 documented / 10 detected (80%)
  Missing from README:
    - WebSocket support — found in src/ws.ts
    - Rate limiting — found in src/middleware/ratelimit.ts
  Over-documented:
    - "AI-powered suggestions" — no code evidence found
```

### 7. Badge URL Validation

Verify that shields.io badges in README return valid responses.

```bash
# Extract badge URLs from README
grep -oE 'https://img\.shields\.io/[^)]+' README.md 2>/dev/null
```

For each badge URL:
- Fetch the URL and check for HTTP 200
- Flag badges that return error SVGs (e.g., "invalid" or "not found")
- Check that badge links point to valid destinations

Report format:
```
Badge Validation:
  ✓ build status — 200 OK (passing)
  ✓ npm version — 200 OK (1.4.1)
  ✗ coverage — 200 OK but shows "unknown" (codecov may not be configured)
  ⚠ downloads — 301 redirect (badge URL format may be outdated)
```

## CI-Friendly Output

When run with the `ci` argument, output results in a format suitable for CI/CD pipelines:

- Exit code 0: all checks pass
- Exit code 1: any check has errors (not warnings)
- Machine-readable output with file:line format for easy IDE integration

```
ERROR: README.md:89 — broken link: docs/guides/migration.md (file not found)
ERROR: llms.txt:5 — sync: ./ROADMAP.md (file not found)
WARN: docs/guides/deployment.md — stale: last updated 95 days ago
WARN: README.md:15 — image: relative path will break on npm
```

## GitHub Actions Workflow Template

For projects that want to run docs verification in CI:

```yaml
name: docs
on:
  pull_request:
    paths:
      - '**.md'
      - 'docs/**'
      - 'llms.txt'
      - 'llms-full.txt'

jobs:
  verify:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Lint Markdown
        uses: DavidAnson/markdownlint-cli2-action@v18
        with:
          globs: '**/*.md'

      - name: Check links
        uses: lycheeverse/lychee-action@v2
        with:
          args: --exclude-private --no-progress docs/ README.md CONTRIBUTING.md CHANGELOG.md
          fail: true
```

## Anti-Patterns

- **Don't ignore warnings** — a broken link today becomes a confused user tomorrow
- **Don't run external link checks on every commit** — run them on PRs and weekly schedules to avoid rate limiting
- **Don't fix docs in a separate PR from code changes** — docs updates should accompany the code that changes behaviour
- **Don't suppress freshness warnings without reviewing** — stale docs erode trust faster than missing docs
