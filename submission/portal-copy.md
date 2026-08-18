# OpenAI plugin submission

Use this copy for the **Skills only** submission type in the OpenAI plugin submission portal.

## Info

- **Plugin name:** Plain English
- **Category:** Productivity
- **Short description:** Clear prose and unambiguous technical documentation.
- **Long description:** Choose between two complementary writing skills. Plain English audits, rewrites, or minimally edits voice-led prose using Orwell and Gowers' rules plus a second pass for common model-writing habits. Simple English rewrites technical documentation with 53 ASD-STE100-derived rules for short sentences, consistent terminology, simple tenses, condition-first commands, and one instruction per sentence. The plugin routes by content type and never combines the conflicting rule sets.
- **Website:** https://github.com/b1rdmania/claude-plain-english-skill
- **Support:** https://github.com/b1rdmania/claude-plain-english-skill/issues
- **Privacy:** https://github.com/b1rdmania/claude-plain-english-skill/blob/main/PRIVACY.md
- **Terms:** https://github.com/b1rdmania/claude-plain-english-skill/blob/main/TERMS.md
- **Logo:** `assets/plain-english-logo.png`
- **Developer identity:** Select the verified individual or business identity that owns the listing. Make the public developer name and support details match that identity.

## Starter prompts

1. Rewrite this in plain English without changing its meaning.
2. Audit this prose for bloat and common AI-writing tics.
3. Rewrite these technical instructions in Simplified Technical English.

## Release notes

Initial public submission of a skills-only writing plugin for ChatGPT and Codex. It bundles Plain English for voice-led prose and Simple English for ASD-STE100-derived technical writing. It contains no MCP server, authentication, telemetry, or external data store.

## Data and permissions

The plugin contains two writing skills and their reference text only. It uses the host product's existing conversation and file capabilities. It does not connect to an external service, create an account, authenticate a user, collect analytics, or retain data independently.

## Availability

Choose only the countries and regions in which the verified publisher is prepared to provide the listing and support it.

## Test cases

Use the five positive and three negative cases in [`test-cases.md`](test-cases.md).
