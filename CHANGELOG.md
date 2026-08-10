# Changelog

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
