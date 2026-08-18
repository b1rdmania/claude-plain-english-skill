#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
packaged_skill="$repo_root/skills/plain-english"

if [[ "${1:-}" == "--check" ]]; then
  cmp --silent "$repo_root/SKILL.md" "$packaged_skill/SKILL.md"
  cmp --silent "$repo_root/REFERENCE.md" "$packaged_skill/REFERENCE.md"
  echo "Packaged plugin skill matches the repository-root skill."
  exit 0
fi

cp "$repo_root/SKILL.md" "$packaged_skill/SKILL.md"
cp "$repo_root/REFERENCE.md" "$packaged_skill/REFERENCE.md"
echo "Updated skills/plain-english from the repository-root skill."
