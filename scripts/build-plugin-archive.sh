#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
manifest_version="$(python3 -c 'import json, pathlib, sys; print(json.loads(pathlib.Path(sys.argv[1]).read_text())["version"])' "$repo_root/.codex-plugin/plugin.json" 2>/dev/null || true)"
version="${1:-$manifest_version}"
archive="$repo_root/dist/plain-english-$version.zip"
build_root="$(mktemp -d)"
plugin_root="$build_root/plain-english"

cleanup() {
  rm -rf "$build_root"
}
trap cleanup EXIT

if [[ -z "$version" ]]; then
  echo "Could not determine the plugin version." >&2
  exit 1
fi

bash "$repo_root/scripts/sync-plugin-skill.sh" --check

mkdir -p "$plugin_root/.claude-plugin" "$plugin_root/.codex-plugin" "$plugin_root/assets" "$plugin_root/output-styles" "$plugin_root/skills/plain-english/agents" "$repo_root/dist"
cp "$repo_root/.claude-plugin/plugin.json" "$plugin_root/.claude-plugin/plugin.json"
cp "$repo_root/.claude-plugin/marketplace.json" "$plugin_root/.claude-plugin/marketplace.json"
cp "$repo_root/output-styles/plain-english.md" "$plugin_root/output-styles/plain-english.md"
cp "$repo_root/.codex-plugin/plugin.json" "$plugin_root/.codex-plugin/plugin.json"
cp "$repo_root/skills/plain-english/SKILL.md" "$plugin_root/skills/plain-english/SKILL.md"
cp "$repo_root/skills/plain-english/REFERENCE.md" "$plugin_root/skills/plain-english/REFERENCE.md"
cp "$repo_root/skills/plain-english/agents/openai.yaml" "$plugin_root/skills/plain-english/agents/openai.yaml"
cp -R "$repo_root/skills/simple-english" "$plugin_root/skills/simple-english"
cp "$repo_root/assets/plain-english-logo.png" "$plugin_root/assets/plain-english-logo.png"
cp "$repo_root/README.md" "$repo_root/PRIVACY.md" "$repo_root/TERMS.md" "$repo_root/LICENSE" "$repo_root/THIRD_PARTY_NOTICES.md" "$plugin_root/"

rm -f "$archive"
(cd "$build_root" && zip -qr "$archive" plain-english)
echo "Built $archive"
