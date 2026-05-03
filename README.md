# plain-english

A Claude Code skill that strips two layers of bad writing from prose:

1. **Classical bloat** — Orwell's six rules + Gowers' plain-words principles. Passive voice, abstract subjects, Latinate padding, dying metaphors.
2. **AI tics** — the LLM dialect: em-dash overuse, banned vocabulary (*delve, tapestry, leverage, multifaceted, realm*), preamble openers, summary closers, reflex rule-of-three lists, false balance, sycophancy.

## Two modes

- **Audit** — paste prose, get marked-up flags and suggested rewrites
- **Rewrite** — get the cleaned version, optionally with notes on what changed

Also runs as a self-audit before Claude delivers long-form prose, so the output isn't recognisably AI-generated.

## Install

Clone into `~/.claude/skills/plain-english/`:

```
git clone https://github.com/b1rdmania/claude-plain-english-skill.git ~/.claude/skills/plain-english
```

## Trigger phrases

"plain English", "tighten this", "make this clearer", "cut the AI voice", "rewrite plainly", "fix the writing", "detox this"

## Sources

- George Orwell, *Politics and the English Language* (1946)
- Sir Ernest Gowers, *Plain Words* (1948), *The ABC of Plain Words* (1951)
- Research on LLM writing tics across Claude, GPT-4, Gemini, Llama (2024–2026)

## License

MIT
