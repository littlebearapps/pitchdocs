#!/usr/bin/env bash
# Validate llms.txt — check that all referenced file paths actually exist
# and that all plugin component files are referenced (orphan detection).
set -euo pipefail

errors=0
warnings=0

echo "=== Validating llms.txt file references ==="

# 1. Check every file path in llms.txt exists
# Extract paths from Markdown links: [text](./path)
grep -oP '(?<=\]\(\./)[^)]+' llms.txt | while read -r path; do
  # Skip external URLs (shouldn't match but safety check)
  case "$path" in http*|mailto*) continue ;; esac
  if [ ! -f "$path" ] && [ ! -d "$path" ]; then
    echo "ERROR: llms.txt references '$path' but file does not exist"
    # Write to temp file since we're in a subshell
    echo "1" >> /tmp/llms-errors.$$
  fi
done

# Collect subshell errors
if [ -f /tmp/llms-errors.$$ ]; then
  errors=$(wc -l < /tmp/llms-errors.$$)
  rm -f /tmp/llms-errors.$$
fi

echo "File reference check complete"

# 2. Orphan detection — check component files are referenced in llms.txt
echo ""
echo "=== Checking for orphaned files ==="

# Normalise paths by stripping ./ prefix for comparison
llms_content=$(sed 's|\./||g' llms.txt)

# Check skills
for f in .claude/skills/*/SKILL.md; do
  [ -f "$f" ] || continue
  if ! echo "$llms_content" | grep -qF "$f"; then
    echo "WARNING: $f not referenced in llms.txt"
    warnings=$((warnings + 1))
  fi
done

# Check companion skill files (SKILL-*.md)
for f in .claude/skills/*/SKILL-*.md; do
  [ -f "$f" ] || continue
  if ! echo "$llms_content" | grep -qF "$f"; then
    echo "WARNING: $f not referenced in llms.txt"
    warnings=$((warnings + 1))
  fi
done

# Check commands
for f in commands/*.md; do
  [ -f "$f" ] || continue
  if ! echo "$llms_content" | grep -qF "$f"; then
    echo "WARNING: $f not referenced in llms.txt"
    warnings=$((warnings + 1))
  fi
done

# Check agents (if directory exists)
if [ -d ".claude/agents" ]; then
  for f in .claude/agents/*.md; do
    [ -f "$f" ] || continue
    if ! echo "$llms_content" | grep -qF "$f"; then
      echo "WARNING: $f not referenced in llms.txt"
      warnings=$((warnings + 1))
    fi
  done
fi

# Check rules
for f in .claude/rules/*.md; do
  [ -f "$f" ] || continue
  if ! echo "$llms_content" | grep -qF "$f"; then
    echo "WARNING: $f not referenced in llms.txt"
    warnings=$((warnings + 1))
  fi
done

# Check hooks
for f in hooks/*.sh; do
  [ -f "$f" ] || continue
  if ! echo "$llms_content" | grep -qF "$f"; then
    echo "WARNING: $f not referenced in llms.txt"
    warnings=$((warnings + 1))
  fi
done

echo "Orphan check complete"

# 3. Check AGENTS.md references too (if it exists)
if [ -f "AGENTS.md" ]; then
  echo ""
  echo "=== Checking AGENTS.md references ==="
  agents_content=$(sed 's|\./||g' AGENTS.md)

  for f in .claude/skills/*/SKILL.md; do
    [ -f "$f" ] || continue
    skill_name=$(basename "$(dirname "$f")")
    if ! echo "$agents_content" | grep -qi "$skill_name"; then
      echo "WARNING: skill '$skill_name' not referenced in AGENTS.md"
      warnings=$((warnings + 1))
    fi
  done

  for f in commands/*.md; do
    [ -f "$f" ] || continue
    cmd_name=$(basename "$f" .md)
    if ! echo "$agents_content" | grep -qi "$cmd_name"; then
      echo "WARNING: command '$cmd_name' not referenced in AGENTS.md"
      warnings=$((warnings + 1))
    fi
  done

  echo "AGENTS.md check complete"
fi

# Summary
echo ""
echo "=== Summary ==="
echo "Errors: $errors"
echo "Warnings: $warnings"

if [ "$errors" -gt 0 ]; then
  exit 1
fi

if [ "$warnings" -gt 0 ]; then
  echo "Warnings found — review orphaned files"
fi
