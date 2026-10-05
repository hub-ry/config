#!/usr/bin/env bash
set -euo pipefail
if [[ "$(uname -s)" != "Darwin" ]]; then
  printf 'rebuild.sh requires macOS; no changes made.\n' >&2
  exit 1
fi
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
exec sudo darwin-rebuild switch --flake "$DIR#RyansMacBook"
