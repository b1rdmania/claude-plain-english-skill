# Changelog

## Unreleased

Claude Code installs from the repository in two commands. `.claude-plugin/marketplace.json` lists the repository as a one-plugin marketplace, so `/plugin marketplace add b1rdmania/claude-plain-english-skill` followed by `/plugin install plain-english@plain-english-marketplace` needs no clone and no `--plugin-dir` flag.

`output-styles/plain-english.md` ships the Plain English rules as a selectable Claude Code output style. It applies the rules to every response rather than only to invoked rewrites, and sets `keep-coding-instructions: true` so software engineering behaviour is unchanged. The style is opt-in: users select it under **Output style** in `/config`.

## v0.5.1 — 2026-09-02

Security hardening for untrusted prose and file contents. The Plain English skill now treats material being audited, rewritten, or edited as data rather than instructions. Embedded commands cannot authorize role changes, disclosure, browsing, tool use, command execution, or access to other files. Edit mode is explicitly limited to files named by the user.

Simple English carries the same boundary. Added an adversarial submission test for indirect prompt injection and documented the boundary in the README.

## v0.5.0 — 2026-08-18

The two-skill release. The plugin now bundles SimpleEnglish 1.2.0 for full ASD-STE100-derived technical writing alongside Plain English for prose with a voice. Each skill has separate triggers and routes incompatible work to its companion instead of mixing both rule sets.

The vendored SimpleEnglish source is pinned to upstream commit `63f5d57f0c56e24108f63655d40f1a2680bd4e6f`, with its MIT licence and attribution preserved in `THIRD_PARTY_NOTICES.md`. Its frontmatter is normalized for strict Codex skill validation and OpenAI interface metadata is added.

## v0.4.0 — 2026-08-18

The shared Agent Skill release. The repository-root skill remains the canonical implementation and keeps the existing Claude Code installation path. Added Claude and Codex plugin manifests, Codex UI metadata, and a self-contained marketplace copy of the skill with an automated drift check.

Also fixed the root YAML description for strict parsers and replaced the Claude-specific "Edit tool" wording with product-neutral file-editing instructions. The editing behaviour is unchanged.

## v0.3.0 — 2026-08-10

The STE layer. Four rules adapted from ASD-STE100 Simplified Technical English, the controlled language aerospace has used for maintenance manuals since 1983:

- No synonym rotation — one name per thing, whole text (Gowers called it elegant variation)
- Condition before command in instructional sentences
- Modal ladder — "should" becomes "must" or a stated fact; readers and models treat "should" as optional
- One instruction per sentence in how-to passages

Deliberately excluded: sentence caps, contraction expansion, the STE dictionary. Those fight the Orwell layer. Full-standard technical docs route to an STE skill instead — see the routing note in SKILL.md.

Also: audit checklist now points at rule numbers instead of paraphrasing them (single source of truth), false balance and sycophancy added to the whole-text checklist, modes named in the frontmatter description.

## v0.2.0 — 2026

- Two-step audit made explicit: flag first, override second, name the override reason in one word
- Edit mode: fix a named file in place with minimal targeted edits
- Second-pass re-check on rewrites before returning
- New tells: unnamed authority, novelty inflation, diff-anchored writing, mechanical paste-tells, modal+hedge stacks

## v0.1.0 — 2026

Initial release. Two passes: Orwell/Gowers classical bloat, then LLM detox (banned vocabulary, em-dash budget, preamble/closer bans, rule-of-three, false balance, hedge stacks). Audit and rewrite modes.
