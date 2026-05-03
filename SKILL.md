---
name: plain-english
description: Tighten prose by stripping AI tics and applying Orwell/Gowers plain-English rules. Use when the user asks to rewrite, tighten, simplify, or detox writing — phrases like "plain English", "make this clearer", "cut the AI voice", "fix the writing", "rewrite plainly", "tighten this", "detox this". Also run as a self-audit pass before delivering long-form prose (essays, blog posts, articles, reports, documentation) so the output isn't recognisably AI-generated.
---

# Plain English

Strip prose of two layers of bad habits:

1. **Classical bloat** — passive voice, abstract subjects, Latinate padding, dying metaphors. The Orwell/Gowers tradition.
2. **AI tics** — the recognisable LLM dialect: em-dash overuse, banned vocabulary, preamble openers, summary closers, reflex rule-of-three lists, false balance, sycophancy.

## Modes

| Mode | When it fires | What to render |
|------|---------------|----------------|
| **Audit** | User pastes prose and asks for critique | For each flagged sentence: original → one-line flag (e.g. *passive without agent*, *abstract subject*, *banned word: leverage*) → suggested rewrite. Don't lecture. Don't restate the rules. |
| **Rewrite** | User asks for a rewrite, OR this skill is invoked as a self-audit before delivering long-form output | Cleaned prose first. If the user asked for explanation, follow with 2–3 bullets of what changed. Bullets, not paragraphs. |

## Core rules

### Orwell/Gowers — apply first

1. Cut every word that adds nothing. If removing it leaves the meaning intact, it goes.
2. Active voice over passive. If you can name the agent, name it.
3. Concrete nouns over abstract. Never start a sentence with an abstract noun ("the realisation of expectations…") if a person or thing can do the work.
4. Short word over long. Saxon over Latinate. *Use* over *utilise*. *Help* over *facilitate*. *Before* over *prior to*.
5. Single word over circumlocution. *Because* over *due to the fact that*.
6. No dying metaphors. If the phrase has been printed a thousand times (*toe the line, Achilles' heel, at the end of the day*), kill it.
7. Break any rule rather than write something barbarous. Clarity wins.

### AI detox — apply second

8. **Banned vocabulary.** See `REFERENCE.md`. Hard list including *delve, tapestry, navigate, leverage, landscape, ecosystem, realm, multifaceted, foster, underscore, robust, comprehensive, nuanced, paramount, crucial, holistic, pivotal*. Substitute or delete.
9. **Em-dash budget.** Maximum one em-dash per ~200 words. Default to commas, full stops, or new sentences. Em-dash overuse is the loudest AI tell.
10. **No preamble.** Don't open with "That's a great question," "Certainly," "I'd be happy to," or framing of the upcoming answer. Start with the answer.
11. **No summary closer.** Don't end with "In conclusion," "To sum up," "I hope this helps," or a paragraph that restates what was just said.
12. **No false balance.** When one side genuinely outweighs the other, say so. No reflex "on the other hand."
13. **No reflex rule-of-three.** If the content has two points or four, use two or four. Don't pad to three.
14. **Vary sentence length.** AI prose clusters around 18–22 words. Good prose ranges from 4 to 40. Mix short punchy sentences with longer ones.
15. **No sycophancy.** Don't validate the user's framing before answering. Don't say "great point."
16. **Cut hedge stacks.** *Genuinely, honestly, it's worth noting, I find that, arguably* — one hedge per claim, max. Stacked hedges erase the claim.

## Audit checklist

The mechanical application of the Core rules above. Used by both modes — audit reports flags, rewrite acts on them.

**Two steps. Don't collapse them.**

1. **Flag first.** Walk every sentence against the Core rules. Do not pre-filter for voice, rhythm, or "the user's style." If a rule fires, mark it.
2. **Override second.** For each flag, decide whether rule 7 (break the rule rather than be barbarous) applies. Name the reason in one word: *rhythm, emphasis, picture, idiom, joke*. If no reason can be named, take the fix.

Walk the checklist:

For each sentence, ask in order:

1. Active or passive? If passive without reason → fix.
2. Any word that could be cut without changing meaning? → cut it.
3. Verbal false limb? (*make contact with, exhibit a tendency to, give consideration to*) → replace with a single verb.
4. Abstract noun as subject? → make it concrete or use a person.
5. Banned LLM vocabulary? Latinate where Saxon fits? → substitute.

For the whole text:

6. Em-dash count vs word count → trim if over budget.
7. Preamble? Summary closer? → delete.
8. Sentence length variation → flag if uniform.
9. Reflex three-part lists → check the count is real, not padded.

## When NOT to apply

- Direct quotes from human sources → leave them.
- Code, technical specifications, legal text → don't "tighten" jargon that's load-bearing.
- The whole text is in deliberate dialect (e.g. AAVE, Scots, period pastiche) → ask before changing. Per-sentence voice judgments belong in the override step above, not here.
- Fiction and creative writing → these rules are for non-fiction. Fiction has its own logic.

## Reference

See `REFERENCE.md` for the full banned-word substitution table and before/after examples. Load it when running an audit or rewrite — that's where the substitution table lives.
