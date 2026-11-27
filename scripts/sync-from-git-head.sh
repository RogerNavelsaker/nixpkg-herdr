#!/usr/bin/env bash
# Pin the herdr input to herdrdev/herdr HEAD (url rev, pinnedRev, flake.lock). The Nushell patch must still apply.
set -euo pipefail
cd "$(git rev-parse --show-toplevel)"
repo=herdrdev/herdr
new=$(git ls-remote "https://github.com/$repo" HEAD | awk '{print $1}')
old=$(grep -oE 'pinnedRev = "[0-9a-f]{40}"' flake.nix | sed -E 's/.*"([^"]+)"/\1/')
[ "$new" != "$old" ] || { echo "up to date: $old"; exit 0; }
sed -i "s/$old/$new/g" flake.nix
nix flake update herdr
echo "bumped $old -> $new"
