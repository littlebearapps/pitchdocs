# Security Policy

## Scope

This is a Claude Code plugin consisting entirely of markdown files. It contains no executable code, no dependencies, and processes no user data. The security surface is limited to the content of the documentation templates it generates.

## Reporting a Concern

If you find that a generated template contains insecure patterns (e.g., a code example with a vulnerability, or a template that encourages unsafe practices):

- [Open an issue](https://github.com/littlebearapps/repo-docs-plugin/issues/new?template=bug_report.yml)
- Or email: hello@littlebearapps.com

## Upstream Specifications

This plugin references third-party specifications. If an upstream spec introduces a security-relevant change, the monthly [upstream drift check](.github/workflows/check-upstream.yml) will detect it and open an issue for review.
