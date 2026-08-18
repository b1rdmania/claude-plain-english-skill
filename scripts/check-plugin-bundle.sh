#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

bash "$repo_root/scripts/sync-plugin-skill.sh" --check
python3 -m json.tool "$repo_root/.claude-plugin/plugin.json" >/dev/null
python3 -m json.tool "$repo_root/.codex-plugin/plugin.json" >/dev/null

test -f "$repo_root/skills/plain-english/SKILL.md"
test -f "$repo_root/skills/simple-english/SKILL.md"
test -f "$repo_root/skills/simple-english/references/checklist.md"
test -f "$repo_root/skills/simple-english/references/use-cases.md"
test -f "$repo_root/THIRD_PARTY_NOTICES.md"

grep -Fq '$simple-english' "$repo_root/skills/plain-english/SKILL.md"
grep -Fq '$plain-english' "$repo_root/skills/simple-english/SKILL.md"
grep -Fq '63f5d57f0c56e24108f63655d40f1a2680bd4e6f' "$repo_root/THIRD_PARTY_NOTICES.md"

bash "$repo_root/scripts/build-plugin-archive.sh"
archive_version="$(python3 -c 'import json, pathlib, sys; print(json.loads(pathlib.Path(sys.argv[1]).read_text())["version"])' "$repo_root/.codex-plugin/plugin.json")"
archive="$repo_root/dist/plain-english-$archive_version.zip"
archive_listing="$(unzip -Z1 "$archive")"

grep -Fqx 'plain-english/skills/plain-english/SKILL.md' <<<"$archive_listing"
grep -Fqx 'plain-english/skills/simple-english/SKILL.md' <<<"$archive_listing"
grep -Fqx 'plain-english/skills/simple-english/references/checklist.md' <<<"$archive_listing"
grep -Fqx 'plain-english/THIRD_PARTY_NOTICES.md' <<<"$archive_listing"

echo "Two-skill plugin bundle is complete."
