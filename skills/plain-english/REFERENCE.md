# Reference

The substitution lists and worked examples for the plain-english skill. Load this when running an audit or rewrite.

## Banned LLM vocabulary

If you reach for one of these, stop. Substitute or delete.

| Word | Substitute |
|------|-----------|
| delve | look at, examine, study |
| tapestry | (delete the metaphor — describe specifically) |
| navigate | (literal only) handle, work through, deal with |
| leverage | use, apply |
| landscape | field, area (or delete) |
| ecosystem | network, world (or delete) |
| realm | field, area (or delete) |
| multifaceted | complex (only if true) |
| paramount | most important |
| unprecedented | new, never seen |
| crucial | important, key |
| robust | strong, reliable |
| comprehensive | full, thorough |
| nuanced | (delete — state the nuance) |
| intricate | complex, detailed |
| foster | grow, build, encourage |
| underscore | show, prove |
| pivotal | key, central |
| holistic | whole, full |
| facilitate | help, enable |
| utilize | use |
| ameliorate | improve |
| expedite | speed up |
| methodology | method |
| commence | start, begin |
| terminate | end |
| endeavour | try |
| numerous | many |
| approximately | about |

## Banned constructions

| Phrase | Fix |
|--------|-----|
| in the realm of | in |
| in the landscape of | in |
| in the world of | in |
| it is important to note that | (delete) |
| it's worth noting that | (delete) |
| it should be noted that | (delete) |
| due to the fact that | because |
| in the event that | if |
| with regard to | about |
| in light of | given, because of |
| prior to | before |
| subsequent to | after |
| in order to | to |
| a variety of | many, several |
| a number of | some |
| at the end of the day | (delete or rewrite) |
| when all is said and done | (delete) |
| the fact of the matter is | (delete) |

## Banned openers

- "That's a great question"
- "Certainly!" / "Absolutely!"
- "I'd be happy to"
- "Great point"
- "What a thoughtful question"
- "I appreciate you asking"

## Banned closers

- "I hope this helps"
- "Let me know if you have any questions"
- "Feel free to ask"
- "In conclusion"
- "To summarise"
- "All in all"

## Banned pivots

Use sparingly, never reflexively:

- "However, it's worth considering"
- "That said"
- "At the same time"
- "On the other hand" (only when there's a real other hand)
- "It's not just X, it's Y"

## Vague attribution

| Vague | Fix |
|-------|-----|
| experts believe | (name the expert) |
| studies show | (name the study) |
| industry leaders agree | (name one) |
| research suggests | (name the source) |

## Novelty inflation

- "He introduced a term" / "she coined the phrase" / "a concept nobody's naming" → describe what they did with the idea, not that they invented it.
- An invented compound term dropped mid-sentence and never defined ("the supervision paradox," "a coordination tax") → define it or describe the mechanism instead of branding it.

## Diff-anchored writing

Docs and comments should describe the thing as it is, not narrate the edit that produced it.

**Before:** This function was added to replace the previous approach of iterating through all items.

**After:** This function uses a hash map for O(1) lookups.

If the history matters, it belongs in the changelog or commit message, not the doc.

## Mechanical tells (always strip)

No judgment call — presence alone is proof of unedited paste-from-chat.

- Unfilled placeholders: `[Your Name]`, `[INSERT SOURCE URL]`, `2025-XX-XX`
- Chat-tool citation markup: `citeturn0search0`, `oai_citation`, `[attached_file:1]`
- AI-tool URL tracking params: `utm_source=chatgpt.com`, `utm_source=perplexity.ai`

## Verbal false limbs (Orwell)

| False limb | Verb |
|------------|------|
| make contact with | call, meet |
| give consideration to | consider |
| take into consideration | consider |
| exhibit a tendency to | tend to |
| play a leading role in | lead |
| serve the purpose of | serve |
| have the effect of | (do the thing directly) |
| render inoperative | break |
| militate against | fight |
| be subjected to | (use active) |
| give rise to | cause |

## Before/after examples

### AI bloat → plain

**Before:** This approach offers a multifaceted solution that leverages cutting-edge methodologies to navigate the complex landscape of modern challenges.

**After:** This approach uses new methods to handle modern problems.

---

**Before:** It's important to note that, in the realm of software engineering, robust testing methodologies are paramount to fostering a culture of comprehensive quality assurance.

**After:** In software, good tests build a culture of quality.

---

**Before:** Delving into this nuanced topic reveals a rich tapestry of interconnected factors that underscore the pivotal role of stakeholder engagement.

**After:** Several factors interact here. Stakeholder engagement matters most.

### Officialese → plain (Gowers)

**Before:** Was this the realisation of an anticipated liability?

**After:** Did you expect to have to do this?

---

**Before:** It should be noted that consideration of the position has given rise to the conclusion that further examination is required.

**After:** We looked at it. We need to look again.

### Passive → active (Orwell)

**Before:** Mistakes were made and lessons have been learned.

**After:** We made mistakes. We learned from them.

---

**Before:** The proposal is being given consideration by the committee.

**After:** The committee is considering the proposal.

### Em-dash detox

**Before:** The skill — which has been carefully designed — strips AI tics — including em-dash overuse — from prose.

**After:** The skill strips AI tics from prose. Em-dash overuse is one of them.

### Hedge stack collapse

**Before:** I genuinely think it's worth noting that this approach may, in some sense, arguably represent a potentially significant improvement.

**After:** This approach is better.

---

**Before:** This could potentially unlock significant efficiency gains.

**After:** This unlocks significant efficiency gains. (One modal, one claim — pick "could unlock" or "unlocks," not both hedges stacked.)

### Preamble + closer cut

**Before:** That's a great question! There are many ways to think about this complex topic. In essence, the answer is that you should use TypeScript. I hope this helps — let me know if you have any further questions!

**After:** Use TypeScript.
