---
description: "Extract features and benefits from a codebase: $ARGUMENTS"
argument-hint: "[project-path, 'table', or 'audit']"
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - mcp__github__get_file_contents
  - mcp__github__list_releases
---

# /features

Scan a codebase, extract its features with evidence, and translate them into benefit-driven language.

## Behaviour

1. Load the `feature-benefits` skill for the extraction workflow and translation framework
2. Load the `doc-standards` rule for tone and language guidance
3. Run the 5-step Feature Extraction Workflow:
   - Detect project type from manifest files
   - Scan all 10 signal categories with concrete file patterns
   - Extract features with file/function evidence
   - Classify into Hero / Core / Supporting tiers
   - Output structured feature inventory
4. Translate each feature into a benefit using the 5 benefit categories

## Arguments

- **No arguments**: Full extraction — outputs a structured feature inventory to chat with Hero, Core, and Supporting tiers
- **`table`**: Outputs a ready-to-paste `| Feature | Benefit | Status |` markdown table suitable for a README
- **`audit`**: Compares extracted features against the existing README features section, reports undocumented and over-documented features

## Output Formats

### Default (Inventory)

```
Feature Inventory: [project-name]

Hero Features (1–3)
  1. [Feature] — [Evidence file] — [Benefit category]
     Benefit: [Translated benefit sentence]

Core Features (4–8)
  2. [Feature] — [Evidence file] — [Benefit category]
     Benefit: [Translated benefit sentence]
  ...

Supporting Features
  9. [Feature] — [Evidence file] — [Benefit category]
  ...
```

### Table Mode

```markdown
| Feature | Benefit | Status |
|---------|---------|--------|
| [Hero feature] | [Benefit sentence] | :white_check_mark: Stable |
| [Core feature] | [Benefit sentence] | :white_check_mark: Stable |
| [Core feature] | [Benefit sentence] | :construction: Beta |
```

### Audit Mode

```
Feature Coverage Audit: [project-name]

Documented features: N (from README)
Detected features:   M (from codebase scan)
Coverage: X%

Missing from README (detected but not documented):
  - [Feature] — [Evidence]
  - [Feature] — [Evidence]

Over-documented (claimed but no evidence found):
  - [Claimed feature] — No matching code found

Recommendation: Run /features table to generate an updated features section
```

## Quality Checks

- Every feature must trace to a specific file, function, or config
- Every benefit must use one of the 5 benefit categories
- No speculative claims — if you can't find evidence, don't list it
- At least 3 different benefit categories used across the table
