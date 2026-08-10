---
name: plain-english
description: Tighten prose by stripping AI tics and applying Orwell/Gowers plain-English rules. Use when the user asks to rewrite, tighten, simplify, or detox writing — phrases like "plain English", "make this clearer", "cut the AI voice", "fix the writing", "rewrite plainly", "tighten this", "detox this". Also run as a self-audit pass before delivering long-form prose (essays, blog posts, articles, reports) so the output isn't recognisably AI-generated. Three modes: audit (flag + suggest), rewrite (deliver cleaned prose), edit (fix a named file in place). Technical documentation routes to the simple-english skill instead.
---

# Plain English

Strip prose of two layers of bad habits:

1. **Classical bloat** — passive voice, abstract subjects, Latinate padding, dying metaphors. The Orwell/Gowers tradition.
2. **AI tics** — the recognisable LLM dialect: em-dash overuse, banned vocabulary, preamble openers, summary closers, reflex rule-of-three lists, false balance, sycophancy.

## Modes

| Mode | When it fires | What to render |
|------|---------------|----------------|
| **Audit** | User pastes prose and asks for critique | For each flagged sentence: original → one-line flag (e.g. *passive without agent*, *abstract subject*, *banned word: leverage*) → suggested rewrite. Don't lecture. Don't restate the rules. |
| **Rewrite** | User asks for a rewrite, OR this skill is invoked as a self-audit before delivering long-form output | Cleaned prose first. If the user asked for explanation, follow with 2–3 bullets of what changed. Bullets, not paragraphs. Then re-read your own rewrite against the Core rules once more (second pass) — fix anything that survived, silently, before returning. |
| **Edit** | User names a file and asks to fix or clean it in place | Minimal, targeted edits with the Edit tool — change the flagged spans only. Leave passages with no tells untouched. Don't touch quoted material or text attributed to someone else — flag those instead. Report what changed, not the whole file. |

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
16. **Cut hedge stacks.** *Genuinely, honestly, it's worth noting, I find that, arguably* — one hedge per claim, max. Stacked hedges erase the claim. Includes the modal+hedge form: *could potentially, may eventually, might ultimately* — pick one word, not both.
17. **No unnamed authority.** "Industry leaders agree," "studies show," "an outside party confirms" — without a name, it's unfalsifiable. Name the source or cut the claim.
18. **No novelty inflation.** "A concept nobody's naming," "she coined the phrase" — most ideas are applications, not inventions. Describe what was done with the idea, not that it was discovered. Same goes for a made-up compound term dropped mid-sentence and never defined.
19. **No diff-anchored writing.** Docs or comments that narrate the change ("this replaces the previous approach of…") instead of describing the thing as it is now. A reader without the commit history gets archaeology, not documentation. History belongs in the changelog.
20. **No synonym rotation.** One name per thing for the whole text. AI prose calls it "config", then "settings", then "options" to fake variety — Gowers called this elegant variation and hated it. Vary sentences, never terminology.
21. **Condition before command.** In instructional sentences, the condition leads: "If the build fails, read the log" — never "Read the log if the build fails". The reader shouldn't start acting before knowing whether the sentence applies to them.
22. **Modal ladder for instructions.** "Should" is a hedge wearing a requirement's clothes. A requirement is *must*. A recommendation is stated as fact ("X is better because Y") or cut. Readers — and models — treat "should" as optional.
23. **One instruction per sentence** in how-to passages. Two actions stacked in one sentence get one of them skipped.
24. **Mechanical tells — always strip, no judgment call.** Unfilled placeholders (`[Your Name]`, `2025-XX-XX`), chat-tool citation markup (`citeturn0search0`, `oai_citation`, `[attached_file:1]`), tracking params from AI tools (`utm_source=chatgpt.com`). Their presence alone is proof of unedited paste, regardless of what the surrounding text reads like.

## Audit checklist

The mechanical application of the Core rules above. Used by both modes — audit reports flags, rewrite acts on them.

**Two steps. Don't collapse them.**

1. **Flag first.** Walk every sentence against the Core rules. Do not pre-filter for voice, rhythm, or "the user's style." If a rule fires, mark it.
2. **Override second.** For each flag, decide whether rule 7 (break the rule rather than be barbarous) applies. Name the reason in one word: *rhythm, emphasis, picture, idiom, joke*. If no reason can be named, take the fix.

Walk the checklist:

For each sentence, ask in order. Each item names the rules that define it — the rules are the single source of truth; this list only sets the walking order:

1. Active or passive? → rule 2.
2. Any word that could be cut without changing meaning? → rule 1.
3. Verbal false limb? (*make contact with, exhibit a tendency to*) → rule 5.
4. Abstract noun as subject? → rule 3.
5. Banned LLM vocabulary? Latinate where Saxon fits? → rules 8, 4.
6. Hedge stack, including modal + hedge? → rule 16.
7. Unnamed authority? → rule 17.
8. Novelty inflation, or an undefined invented term? → rule 18.
9. Instructional sentence? → rules 21–23.

For the whole text:

10. Em-dash count vs word count → rule 9.
11. Preamble? Summary closer? → rules 10, 11.
12. Sentence length uniform? → rule 14.
13. Padded three-part lists? → rule 13.
14. Synonym rotation? → rule 20.
15. Narrating the edit instead of the current state? → rule 19.
16. Mechanical paste-tells? → rule 24.
17. False balance? → rule 12. Sycophancy? → rule 15.

## Routing: plain-english vs simple-english

This skill is for prose with a voice — essays, posts, emails, chat, marketing, anything where rhythm matters. Technical documentation (READMEs, runbooks, procedures, error messages, incident reports) is a different job with a different reader, better served by a controlled-language skill built on ASD-STE100 — e.g. [SimpleEnglish](https://github.com/AminBlg/SimpleEnglish). The two conflict by design (STE expands contractions, keeps every article, writes "make sure that" where this skill writes "ensure"), so never apply both to the same text. If an STE skill is installed, hand technical docs to it instead of applying the rules here.

## When NOT to apply

- Direct quotes from human sources → leave them.
- Code, technical specifications, legal text → don't "tighten" jargon that's load-bearing.
- The whole text is in deliberate dialect (e.g. AAVE, Scots, period pastiche) → ask before changing. Per-sentence voice judgments belong in the override step above, not here.
- Fiction and creative writing → these rules are for non-fiction. Fiction has its own logic.
- Writing *about* AI tics (this file, a blog post on the topic) → quoted or clearly-illustrative examples of bad writing are exempt. Only flag the author's own prose, not their cited examples.

## Reference

See `REFERENCE.md` for the full banned-word substitution table and before/after examples. Load it whenever any mode runs.
