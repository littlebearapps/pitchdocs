#!/usr/bin/env python3
"""Validate YAML frontmatter in skills, commands, and agents.

Parses YAML properly (handles special characters, quoted strings, arrays)
rather than relying on grep. Checks required fields and field types.
"""

import re
import sys
import glob
import yaml
from pathlib import Path

errors = []
warnings = []

SKILL_REQUIRED = {"name": str, "description": str}
SKILL_OPTIONAL = {"version": str, "author": str, "tags": list}

COMMAND_REQUIRED = {"description": str}

AGENT_REQUIRED = {"name": str}
AGENT_OPTIONAL = {"description": str}


def extract_frontmatter(filepath: str) -> dict | None:
    """Extract YAML frontmatter from a Markdown file."""
    try:
        with open(filepath) as f:
            content = f.read()
    except OSError as e:
        errors.append(f"{filepath}: cannot read file — {e}")
        return None

    if not content.startswith("---"):
        errors.append(f"{filepath}: missing YAML frontmatter (file must start with ---)")
        return None

    parts = content.split("---", 2)
    if len(parts) < 3:
        errors.append(f"{filepath}: malformed frontmatter (no closing ---)")
        return None

    try:
        data = yaml.safe_load(parts[1])
    except yaml.YAMLError:
        # Claude Code agent frontmatter uses non-standard YAML (e.g. unquoted
        # comma-separated `when:` values, `tools:` lists). Fall back to
        # regex-based field extraction for these files.
        data = {}
        for line in parts[1].strip().splitlines():
            match = re.match(r"^(\w+):\s*(.+)?$", line)
            if match:
                key = match.group(1)
                value = (match.group(2) or "").strip().strip('"').strip("'")
                data[key] = value
        if not data:
            errors.append(f"{filepath}: cannot parse frontmatter (neither YAML nor key-value)")
            return None
        return data

    if not isinstance(data, dict):
        errors.append(f"{filepath}: frontmatter is not a YAML mapping")
        return None

    return data


def check_fields(filepath: str, data: dict, required: dict, optional: dict | None = None):
    """Check required fields exist and have correct types."""
    for field, expected_type in required.items():
        if field not in data:
            errors.append(f"{filepath}: missing required field '{field}'")
        elif not isinstance(data[field], expected_type):
            errors.append(
                f"{filepath}: field '{field}' should be {expected_type.__name__}, "
                f"got {type(data[field]).__name__}"
            )
        elif isinstance(data[field], str) and not data[field].strip():
            errors.append(f"{filepath}: field '{field}' is empty")

    if optional:
        for field, expected_type in optional.items():
            if field in data and not isinstance(data[field], expected_type):
                warnings.append(
                    f"{filepath}: field '{field}' should be {expected_type.__name__}, "
                    f"got {type(data[field]).__name__}"
                )


def main():
    # Validate skills
    skill_files = sorted(glob.glob(".claude/skills/*/SKILL.md"))
    for f in skill_files:
        data = extract_frontmatter(f)
        if data:
            check_fields(f, data, SKILL_REQUIRED, SKILL_OPTIONAL)
    print(f"Checked {len(skill_files)} skill files")

    # Validate commands
    command_files = sorted(glob.glob("commands/*.md"))
    for f in command_files:
        data = extract_frontmatter(f)
        if data:
            check_fields(f, data, COMMAND_REQUIRED)
    print(f"Checked {len(command_files)} command files")

    # Validate agents
    agent_files = sorted(glob.glob(".claude/agents/*.md"))
    for f in agent_files:
        data = extract_frontmatter(f)
        if data:
            check_fields(f, data, AGENT_REQUIRED, AGENT_OPTIONAL)
    print(f"Checked {len(agent_files)} agent files")

    # Report
    for w in warnings:
        print(f"WARNING: {w}")
    for e in errors:
        print(f"ERROR: {e}")

    if errors:
        print(f"\n{len(errors)} error(s) found")
        sys.exit(1)
    else:
        print("\nAll frontmatter valid")


if __name__ == "__main__":
    main()
