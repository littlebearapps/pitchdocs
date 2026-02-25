---
description: "Generate or update a marketing-friendly README.md: $ARGUMENTS"
argument-hint: "[project-path or description of focus]"
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Write
  - Edit
  - WebFetch
  - mcp__github__get_file_contents
  - mcp__github__list_releases
  - mcp__github__list_tags
---

# /readme

Generate or update a README.md that sells as well as it informs.

## Behaviour

1. Run the `docs-writer` agent
2. Load the `public-readme` skill for structure and marketing framework
3. Load the `feature-benefits` skill for systematic feature extraction
4. Load the `doc-standards` rule for tone, language, and badge standards
5. Scan the codebase using the 5-step Feature Extraction Workflow — extract features with evidence, classify by tier, translate to benefits
6. Generate README.md with the full marketing framework:
   - Hero section with one-liner and badges
   - "Why [Project]?" with benefit-driven feature descriptions
   - Quick start (under 5 minutes)
   - Features table with benefits column
   - Documentation links (including user guides if `docs/guides/` exists)
   - Contributing CTA
   - License

## Arguments

- No arguments: generates README for current directory
- Path argument: generates README for the specified project directory
- Description argument: focuses the README on specific aspects (e.g., "focus on the CLI interface")

## Output

Writes directly to `README.md` in the target directory. If a README already exists, it is read first and either updated or regenerated based on quality assessment.

## Quality Check

After generation, verify:
- First paragraph is understandable by a non-developer
- All badge URLs are correct for this repo
- Quick start code examples actually work
- Links to existing docs/guides are included
- Consistent spelling throughout
- Features table has a benefits column with evidence-based claims
- At least 3 different benefit categories used across the features table
