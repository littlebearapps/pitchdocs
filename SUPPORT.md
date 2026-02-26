# Support

Need help with PitchDocs? Here's how to get it.

## Getting Help

- **GitHub Issues** — [Open an issue](https://github.com/littlebearapps/pitchdocs/issues/new/choose) for bug reports, feature requests, or questions about generated output
- **Discussions** — Browse [existing issues](https://github.com/littlebearapps/pitchdocs/issues) to see if your question has already been answered
- **Contributing Guide** — See [CONTRIBUTING.md](CONTRIBUTING.md) for development setup and how to improve templates

## Common Questions

### Generated output doesn't look right

PitchDocs generates documentation based on your codebase analysis. If the output is missing features or has incorrect information, try:

1. Ensure your project has a manifest file (`package.json`, `pyproject.toml`, `Cargo.toml`, etc.)
2. Check that your git history uses conventional commits for best changelog results
3. Run `/features audit` to see what PitchDocs detects vs what your README claims

### Content filter blocks generation

Claude Code's API may return HTTP 400 when generating `CODE_OF_CONDUCT.md`, `SECURITY.md`, or `LICENSE` files. This is a [known upstream issue](https://github.com/anthropics/claude-code/issues/2111). PitchDocs includes built-in workarounds — the plugin fetches these files from canonical URLs instead.

### Using with other AI tools

PitchDocs works with Claude Code, OpenCode, Codex CLI, Cursor, Gemini CLI, Aider, and Goose. See the [Use with Other AI Tools](README.md#-use-with-other-ai-tools) section in the README for setup instructions.

## Contact

- **Email**: [hello@littlebearapps.com](mailto:hello@littlebearapps.com)
- **Security issues**: See [SECURITY.md](SECURITY.md) for responsible disclosure

## Response Times

- Bug reports: triaged within 48 hours
- Feature requests: reviewed within 1 week
- Security issues: acknowledged within 48 hours, resolved within 7 days
