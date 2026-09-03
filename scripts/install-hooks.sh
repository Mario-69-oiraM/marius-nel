#!/usr/bin/env bash
# Point git at the repository's checked-in hooks.
#
# Hooks live in `.githooks/` so they are version-controlled and reviewable.
# `core.hooksPath` is local config, so every clone runs this once.

set -euo pipefail

cd "$(dirname "$0")/.."
chmod +x .githooks/*
git config core.hooksPath .githooks

echo "Hooks installed: $(ls .githooks | tr '\n' ' ')"
echo "The publish gate now runs on every push (bypass: git push --no-verify)."
