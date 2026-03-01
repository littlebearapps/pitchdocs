# Documentation Verifier — Extended Reference

Extended patterns and templates for the `docs-verify` skill. Load this file when you need enhanced link detection, token auditing, or CI workflow templates.

## Enhanced Link Detection Patterns

Four patterns that cause silent breakage not caught by basic link checking:

**1. Case-sensitivity (Linux hidden bugs)**

On Linux, verify the file path matches case exactly. macOS silently accepts wrong-case paths — Linux does not:

```bash
# If find returns a result that differs in case from the link, flag it
find . -iname "$(basename "$link_path")" | grep -v "^$link_path$" 2>/dev/null
```

**2. Fragment-only anchors (same-file jumps)**

For links like `[see setup](#setup-section)`:
- Extract the heading text and convert to GitHub anchor format: lowercase, spaces to hyphens, strip punctuation
- Search the target file for the matching heading
- Flag "did you mean #X?" when no match but a close heading exists (Levenshtein distance ≤ 2)

**3. Redirect chains**

Flag external URLs that redirect through more than 1 hop:

```bash
curl -Ls -o /dev/null -w "%{url_effective} (via %{num_redirects} redirects)\n" "$url"
# Flag if num_redirects > 1
```

**4. Relative links in nested documents**

For links found in `docs/guides/*.md`, resolve relative paths from the document's directory, not the repo root:

```bash
doc_dir=$(dirname "$doc_file")
resolved="$doc_dir/$relative_link"
[ -f "$resolved" ] || echo "✗ $doc_file — $relative_link (resolved to $resolved, not found)"
```

## Token Audit (Check 8)

Estimate token cost for all skill files in `.claude/skills/`. Flag skills that may be degrading context efficiency.

```bash
# Estimate token cost for all skills
for skill_dir in .claude/skills/*/; do
  skill_file="$skill_dir/SKILL.md"
  if [ -f "$skill_file" ]; then
    words=$(wc -w < "$skill_file")
    tokens=$(echo "$words * 13 / 10" | bc)
    name=$(basename "$skill_dir")
    echo "${tokens} tokens — ${name}"
  fi
done | sort -rn
```

Thresholds (from `doc-standards` rule):
- Under 3,000 tokens: healthy
- 3,000–5,000 tokens: acceptable, monitor
- Over 5,000 tokens: flag for refactor — split into SKILL.md + SKILL-extended.md

Report format:
```
Token Audit:
  ✓ feature-benefits — 2,847 tokens (healthy)
  ⚠ pitchdocs-suite — 4,312 tokens (acceptable — monitor)
  ✗ docs-verify — 5,890 tokens (exceeds 5k — consider splitting)
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
