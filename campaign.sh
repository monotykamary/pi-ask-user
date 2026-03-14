#!/bin/bash
set -euo pipefail

manifest="campaign.files"
checked=0

while IFS= read -r path; do
  [ -n "$path" ] || continue

  if [ ! -f "$path" ]; then
    echo "Missing file: $path" >&2
    exit 1
  fi

  bytes=$(wc -c < "$path" | tr -d ' ')
  kind=$(file -b "$path")
  printf 'CHECK %s | bytes=%s | type=%s\n' "$path" "$bytes" "$kind"
  checked=$((checked + 1))
done < "$manifest"

echo "METRIC files_checked=$checked"
