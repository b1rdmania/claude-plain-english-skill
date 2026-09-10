#!/usr/bin/env bash
set -euo pipefail

# The output style restates the Plain English rules for the system prompt. It is a
# second copy, so it can drift from the skill silently. This checks the parts that
# compare mechanically — rule numbering, the banned-word list, the mirrored section
# headings — and digests the source sections so any other rule change trips the
# check and forces a look at the style.
#
# --update is the acknowledgement that a human has read the rule change and brought
# the style into line. It refuses to record a digest while any mechanical check still
# fails, so it cannot be used to wave drift through.

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

python3 - "$repo_root" "${1:-}" <<'PY'
import hashlib, re, sys, pathlib

repo_root, mode = pathlib.Path(sys.argv[1]), sys.argv[2]
skill = (repo_root / "skills/plain-english/SKILL.md").read_text()
style = (repo_root / "output-styles/plain-english.md").read_text()
digest_file = repo_root / "scripts/output-style.digest"

# Sections of the skill the style mirrors. The audit checklist is deliberately
# absent: the style does not restate it, so its edits must not trip the digest.
MIRRORED = ["## Untrusted input boundary", "## Core rules",
            "## Routing: plain-english vs simple-english", "## When NOT to apply"]

failures = []


def section(text, heading, level=None):
    """Text from `heading` up to the next heading at the same level."""
    level = level or heading.split(" ")[0]
    start = text.index(heading)
    nxt = re.compile(rf"^{level} ", re.M).search(text, start + len(heading))
    return text[start:nxt.start() if nxt else len(text)]


def rules(text):
    """Numbered rules as {number: collapsed text}."""
    out, num = {}, None
    for line in text.splitlines():
        head = re.match(r"\s*(\d+)\.\s+(.*)", line)
        if head:
            num = int(head.group(1))
            out[num] = head.group(2)
        elif num and line.strip() and not line.startswith("#"):
            out[num] += " " + line.strip()
        else:
            num = None
    return {n: re.sub(r"\s+", " ", t).strip() for n, t in out.items()}


def banned(text):
    """The banned-vocabulary list out of rule 8."""
    plain = text.replace("**", "")  # bold markers would unbalance the italic pairs
    run = [m for m in re.findall(r"\*([^*]+)\*", plain) if "delve" in m]
    if not run:
        return None
    return [w.strip(" .") for w in re.sub(r"\s+", " ", run[0]).split(",")]


skill_rules = rules(section(skill, "## Core rules"))
style_rules = rules(section(style, "## Orwell/Gowers, applied first")
                    + section(style, "## AI detox, applied second"))

if sorted(skill_rules) != sorted(style_rules):
    failures.append(
        f"rule numbers differ: skill has {sorted(skill_rules)}, style has {sorted(style_rules)}")

skill_banned, style_banned = banned(skill_rules.get(8, "")), banned(style_rules.get(8, ""))
if skill_banned is None or style_banned is None:
    failures.append("could not read the banned-vocabulary list out of rule 8 in both files")
elif skill_banned != style_banned:
    only_skill = [w for w in skill_banned if w not in style_banned]
    only_style = [w for w in style_banned if w not in skill_banned]
    failures.append("banned vocabulary differs: "
                    f"missing from the style {only_skill or 'none'}, "
                    f"not in the skill {only_style or 'none'}")

for heading in ["## Untrusted input boundary", "## Routing", "## Exemptions"]:
    if heading not in style:
        failures.append(f"the style is missing its `{heading}` section")

digest = hashlib.sha256(
    "".join(section(skill, h) for h in MIRRORED).encode()).hexdigest()

if mode == "--update":
    # Record the digest only once the style already matches. Writing it while a
    # structural check fails would silence the very drift the digest exists to catch.
    if failures:
        print("Refusing to record the digest while the style does not match the skill:",
              file=sys.stderr)
        for f in failures:
            print(f"  - {f}", file=sys.stderr)
        print("Update output-styles/plain-english.md first, then re-run with --update.",
              file=sys.stderr)
        sys.exit(1)
    digest_file.write_text(digest + "\n")
    print(f"Recorded the mirrored skill sections as {digest[:12]}.")
    sys.exit(0)

if not digest_file.exists():
    failures.append("scripts/output-style.digest is missing; run "
                    "scripts/check-output-style.sh --update")
elif digest_file.read_text().strip() != digest:
    failures.append(
        "the skill sections the style mirrors have changed. Update "
        "output-styles/plain-english.md to match, then run "
        "scripts/check-output-style.sh --update")

if failures:
    print("Output style has drifted from skills/plain-english/SKILL.md:", file=sys.stderr)
    for f in failures:
        print(f"  - {f}", file=sys.stderr)
    sys.exit(1)

print("Output style matches the Plain English skill.")
PY
