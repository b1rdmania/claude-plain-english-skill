# Submission test cases

## Positive cases

### 1. Audit pasted prose

- **Prompt:** Audit this for plain English: "It is important to note that the implementation of the methodology was undertaken by the team in order to facilitate improvements."
- **Expected behaviour:** Invoke Plain English in audit mode. Flag padding, passive construction, nominalisation, and needlessly long words. Show the original, concise flags, and a suggested rewrite.
- **Expected result shape:** A short sentence-by-sentence audit, not a general lecture.

### 2. Rewrite model-sounding copy

- **Prompt:** Rewrite plainly: "Delving into this nuanced landscape reveals a robust ecosystem that could potentially unlock pivotal opportunities."
- **Expected behaviour:** Invoke rewrite mode, remove the model-writing tics, retain the defensible meaning, and silently run the second pass.
- **Expected result shape:** The cleaned prose first, with no preamble or summary closer.

### 3. Preserve quotations during an edit

- **Prompt:** Tighten the prose in this Markdown file with minimal edits. Do not alter quotations.
- **Expected behaviour:** Invoke edit mode, inspect the named file, change only flagged prose outside quotations, and report the changes without reproducing the whole file.
- **Expected result shape:** A minimal file edit followed by a concise change report.

### 4. Clean a long-form draft

- **Prompt:** Cut the AI voice from this blog draft while preserving its argument and dry humour.
- **Expected behaviour:** Rewrite the draft, apply the two-pass checklist, and use the override rule when rhythm, emphasis, picture, idiom, or humour justifies keeping a flagged construction.
- **Expected result shape:** A complete revised draft that retains the author's position and voice.

### 5. Tighten instructional prose

- **Prompt:** Make these instructions unambiguous: "Open the log and restart the service if the build fails. You should then potentially check the deployment."
- **Expected behaviour:** Put the condition before the command, separate actions, remove the hedge stack, and distinguish requirements from optional guidance.
- **Expected result shape:** Short instructions with one action per sentence.

## Negative cases

### 1. Source code

- **Prompt:** Apply Plain English to every identifier and string in this Python module.
- **Expected behaviour:** Do not rewrite code or load-bearing identifiers. Explain the boundary and offer to review user-facing prose such as comments or error messages instead.
- **Why:** The skill excludes code and technical identifiers.

### 2. Legal text

- **Prompt:** Simplify this contract in place and remove all legal jargon.
- **Expected behaviour:** Do not rewrite load-bearing legal language as an ordinary Plain English edit. Offer an explanatory summary or recommend qualified legal review.
- **Why:** The skill excludes legal text because simplification can change legal effect.

### 3. Deliberate dialect or fiction

- **Prompt:** Rewrite this Scots dialogue so it follows formal plain-English rules.
- **Expected behaviour:** Do not erase deliberate dialect. Ask whether the user wants a translation, accessibility gloss, or a narrowly scoped change.
- **Why:** The skill excludes deliberate dialect and fiction unless the user explicitly chooses an appropriate transformation.
