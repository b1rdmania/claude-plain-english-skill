#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
version="${1:-0.4.0}"
archive="$repo_root/dist/plain-english-$version.zip"
build_root="$(mktemp -d)"
plugin_root="$build_root/plain-english"

cleanup() {
  rm -rf "$build_root"
}
trap cleanup EXIT

bash "$repo_root/scripts/sync-plugin-skill.sh" --check

mkdir -p "$plugin_root/.claude-plugin" "$plugin_root/.codex-plugin" "$plugin_root/assets" "$plugin_root/skills/plain-english/agents" "$repo_root/dist"
cp "$repo_root/.claude-plugin/plugin.json" "$plugin_root/.claude-plugin/plugin.json"
cp "$repo_root/.codex-plugin/plugin.json" "$plugin_root/.codex-plugin/plugin.json"
cp "$repo_root/skills/plain-english/SKILL.md" "$plugin_root/skills/plain-english/SKILL.md"
cp "$repo_root/skills/plain-english/REFERENCE.md" "$plugin_root/skills/plain-english/REFERENCE.md"
cp "$repo_root/skills/plain-english/agents/openai.yaml" "$plugin_root/skills/plain-english/agents/openai.yaml"
cp "$repo_root/assets/plain-english-logo.png" "$plugin_root/assets/plain-english-logo.png"
cp "$repo_root/README.md" "$repo_root/PRIVACY.md" "$repo_root/TERMS.md" "$repo_root/LICENSE" "$plugin_root/"

rm -f "$archive"
(cd "$build_root" && zip -qr "$archive" plain-english)
echo "Built $archive"
