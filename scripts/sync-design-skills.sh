#!/usr/bin/env bash
# sync-design-skills.sh: re-copy the pinned upstream design skills into vendor/design/.
#
# What it does, for every entry in vendor/design/skills.lock:
#   1. Fetches the upstream repo at the exact pinned commit SHA (shallow, git hooks disabled).
#   2. Copies ONLY the skill's source folder and its license files. Nothing is built or executed.
#   3. Removes the paths listed in "strip" (e.g. upstream installers).
#   4. Re-applies our Lev patch from vendor/design/patches/ (unless --pristine).
#   5. Prints a unified diff between the freshly built copy and what is in the tree.
#
# It NEVER runs npm/pnpm/pip install, postinstall hooks, install.sh, or any upstream script.
# To move a pin: edit "sha" (and "version") in skills.lock, run this script, review the diff,
# refresh the patch if it no longer applies, then run again with --apply.
#
# Usage: scripts/sync-design-skills.sh [--apply] [--pristine] [--only <name>]
#   (default)    dry run: build in a temp dir and print the diff against the tree; exit 1 if it differs
#   --apply      write the rebuilt copies into vendor/design/ (replaces each skill's folder)
#   --pristine   skip strips and patches (shows exactly what upstream ships)
#   --only NAME  limit to one lock entry
#
# Requires: bash, git, jq, diff.
set -euo pipefail

APPLY=0; PRISTINE=0; ONLY=""
while [ $# -gt 0 ]; do
  case "$1" in
    --apply) APPLY=1 ;;
    --pristine|--no-patches) PRISTINE=1 ;;
    --only) ONLY="${2:?--only needs a name}"; shift ;;
    -h|--help) sed -n '2,22p' "$0"; exit 0 ;;
    *) echo "unknown argument: $1" >&2; exit 2 ;;
  esac
  shift
done

for bin in git jq diff; do
  command -v "$bin" >/dev/null || { echo "missing required tool: $bin" >&2; exit 2; }
done

ROOT="$(git rev-parse --show-toplevel)"
PACK="$ROOT/vendor/design"
LOCK="$PACK/skills.lock"
WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT
export GIT_TERMINAL_PROMPT=0 GIT_LFS_SKIP_SMUDGE=1
GITQ=(git -c core.hooksPath=/dev/null -c advice.detachedHead=false -c protocol.file.allow=never)

changed=0
count=$(jq '.skills | length' "$LOCK")
for i in $(seq 0 $((count - 1))); do
  e() { jq -r ".skills[$i].$1 // empty" "$LOCK"; }
  name="$(e name)"
  [ -n "$ONLY" ] && [ "$ONLY" != "$name" ] && continue
  url="$(e upstream)"; sha="$(e sha)"; src="$(e src)"; dest="$(e path)"
  vendored="$(jq -r ".skills[$i].vendored" "$LOCK")"; patch="$(e patch)"

  case "$sha" in *[!0-9a-f]*|"") echo "$name: sha must be a full lowercase hex commit" >&2; exit 2 ;; esac
  [ ${#sha} -eq 40 ] || { echo "$name: sha must be 40 chars" >&2; exit 2; }
  case "$dest" in vendor/design/*) ;; *) echo "$name: path must live under vendor/design/" >&2; exit 2 ;; esac

  echo "==> $name @ ${sha:0:12} ($url)"
  up="$WORK/up/$name"
  "${GITQ[@]}" init -q "$up"
  "${GITQ[@]}" -C "$up" fetch -q --depth 1 --no-tags "$url" "$sha"
  "${GITQ[@]}" -C "$up" checkout -q FETCH_HEAD
  got="$("${GITQ[@]}" -C "$up" rev-parse HEAD)"
  [ "$got" = "$sha" ] || { echo "$name: fetched $got, expected $sha" >&2; exit 1; }

  # License files go to vendor/design/LICENSES/<name>-<file>
  mkdir -p "$WORK/out/LICENSES"
  while IFS= read -r lf; do
    [ -n "$lf" ] || continue
    cp -p "$up/$lf" "$WORK/out/LICENSES/$name-$(basename "$lf")"
    if ! cmp -s "$WORK/out/LICENSES/$name-$(basename "$lf")" "$PACK/LICENSES/$name-$(basename "$lf")" 2>/dev/null; then
      diff -uN "$PACK/LICENSES/$name-$(basename "$lf")" "$WORK/out/LICENSES/$name-$(basename "$lf")" || true
      changed=1
      [ "$APPLY" = 1 ] && mkdir -p "$PACK/LICENSES" && cp -p "$WORK/out/LICENSES/$name-$(basename "$lf")" "$PACK/LICENSES/"
    fi
  done < <(jq -r ".skills[$i].licenseFiles[]?" "$LOCK")

  # Lev-authored entries (vendored=false) only track the upstream license.
  [ "$vendored" = "true" ] || continue

  out="$WORK/out/$dest"
  mkdir -p "$out"
  cp -Rp "$up/$src/." "$out/"
  find "$out" -name .git -prune -exec rm -rf {} +

  if [ "$PRISTINE" = 0 ]; then
    while IFS= read -r s; do
      [ -n "$s" ] || continue
      case "$s" in *..*|/*) echo "$name: bad strip path $s" >&2; exit 2 ;; esac
      rm -rf "${out:?}/$s"
    done < <(jq -r ".skills[$i].strip[]?" "$LOCK")
    if [ -n "$patch" ]; then
      (cd "$out" && git apply --whitespace=nowarn "$PACK/patches/$patch") \
        || { echo "$name: patch $patch no longer applies; refresh it" >&2; exit 1; }
    fi
  fi

  if ! diff -ruN "$ROOT/$dest" "$out" >"$WORK/$name.diff"; then
    changed=1
    cat "$WORK/$name.diff"
    if [ "$APPLY" = 1 ]; then
      rm -rf "${ROOT:?}/$dest"
      mkdir -p "$(dirname "$ROOT/$dest")"
      cp -Rp "$out" "$ROOT/$dest"
      echo "    wrote $dest"
    fi
  else
    echo "    up to date"
  fi
done

if [ "$changed" = 1 ] && [ "$APPLY" = 0 ]; then
  echo "Differences found (dry run). Re-run with --apply to write them." >&2
  exit 1
fi
echo "done."
