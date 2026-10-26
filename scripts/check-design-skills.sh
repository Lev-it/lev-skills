#!/usr/bin/env bash
# check-design-skills.sh: sanity checks for vendor/design/ (read-only, runs nothing from upstream).
#   1. Every SKILL.md has valid YAML frontmatter with a non-empty name and description.
#   2. skills.lock is valid and every listed path exists.
#   3. No installer, credential, .env or exfiltration instructions in the optional/ trial skills.
#      (Also scans core/ and prints what it finds, for review, without failing.)
#   4. gitleaks over vendor/design and scripts/ if gitleaks is on PATH (or GITLEAKS=/path).
# Usage: scripts/check-design-skills.sh
set -uo pipefail
ROOT="$(git rev-parse --show-toplevel)"; cd "$ROOT"
PACK=vendor/design
fail=0

echo "== 1. SKILL.md frontmatter"
python3 - "$PACK" <<'PY' || fail=1
import sys, os, re
try:
    import yaml
except ImportError:
    yaml = None
    print("  (PyYAML not installed: using the strict-subset fallback parser)")
bad = 0; n = 0
for dp, dn, fn in os.walk(sys.argv[1]):
    if "SKILL.md" not in fn: continue
    p = os.path.join(dp, "SKILL.md"); n += 1
    s = open(p, encoding="utf-8").read()
    m = re.match(r"---\r?\n(.*?)\r?\n---\r?\n", s, re.S)
    if not m:
        print(f"  FAIL {p}: no frontmatter block"); bad += 1; continue
    fm = m.group(1)
    if yaml:
        try: d = yaml.safe_load(fm)
        except Exception as e:
            print(f"  FAIL {p}: YAML error: {e}"); bad += 1; continue
    else:
        d = {}
        for k, v in re.findall(r"^([A-Za-z][\w-]*):[ \t]*(.*)$", fm, re.M):
            v = v.strip()
            if re.fullmatch(r"[>|][-+]?", v):  # block scalar: take the indented lines below
                blk = re.search(rf"^{k}:[ \t]*[>|][-+]?\r?\n((?:[ \t]+.*\r?\n?)+)", fm, re.M)
                v = " ".join(l.strip() for l in blk.group(1).splitlines()) if blk else ""
            d[k] = v.strip("\"'")
    if not isinstance(d, dict):
        print(f"  FAIL {p}: frontmatter is not a mapping"); bad += 1; continue
    name, desc = d.get("name"), d.get("description")
    if not isinstance(name, str) or not re.fullmatch(r"[a-z0-9][a-z0-9-]{0,63}", name or ""):
        print(f"  FAIL {p}: bad or missing name: {name!r}"); bad += 1
    if not isinstance(desc, str) or len(desc.strip()) < 20:
        print(f"  FAIL {p}: missing or too-short description"); bad += 1
    if isinstance(desc, str) and len(desc) > 1024:
        print(f"  WARN {p}: description is {len(desc)} chars (>1024; some harnesses truncate)")
print(f"  {n} SKILL.md files checked, {bad} problems")
sys.exit(1 if bad else 0)
PY

echo "== 2. skills.lock"
if jq -e '.skills | length > 0' "$PACK/skills.lock" >/dev/null; then
  while IFS=$'\t' read -r name path sha; do
    [ -d "$path" ] || { echo "  FAIL $name: path $path missing"; fail=1; }
    [ ${#sha} -eq 40 ] || { echo "  FAIL $name: sha not 40 chars"; fail=1; }
  done < <(jq -r '.skills[] | [.name,.path,.sha] | @tsv' "$PACK/skills.lock")
  echo "  $(jq '.skills|length' "$PACK/skills.lock") entries ok"
else
  echo "  FAIL skills.lock is not valid JSON"; fail=1
fi

echo "== 3. red-flag scan"
PATTERNS=(
  '(curl|wget)[^|]*\|[[:space:]]*(ba|z)?sh'          # pipe to shell
  '\b(curl|wget)[[:space:]]+(-[a-zA-Z]+[[:space:]]+)*https?://'  # download commands
  'install\.sh|"postinstall"[[:space:]]*:|npx skills add'  # installers
  'dotenv|~/\.claude/\.env|(open|read|load|source|cat)[^;]{0,40}\.env\b'  # .env loading
  '(process\.env|os\.environ|getenv)[^;)]*(API_KEY|TOKEN|SECRET|PASSWORD)'  # secret env reads
  '~/\.ssh|id_rsa|\.aws/credentials|\.npmrc|\.netrc'   # credential files
  '[Ii]gnore (all |any )?(previous|prior|above) instructions'  # prompt injection
  'base64 (-d|--decode)|eval\(atob|child_process.*(curl|wget)'  # obfuscated exec
)
# Reviewed, benign matches (e.g. "do NOT create an .npmrc"). Format: <path>|<fixed substring>
ALLOW="$PACK/redflag-allowlist.txt"
scan() { # $1=dir
  local hits=0
  for pat in "${PATTERNS[@]}"; do
    out=$(grep -rnIE --exclude='*.csv' "$pat" "$1" 2>/dev/null | while IFS= read -r line; do
      ok=0
      while IFS='|' read -r ap sub; do
        case "$ap" in ''|'#'*) continue ;; esac
        case "$line" in "$ap:"*) case "$line" in *"$sub"*) ok=1 ;; esac ;; esac
      done < "$ALLOW"
      [ "$ok" = 1 ] || printf '%s\n' "$line"
    done)
    [ -n "$out" ] && { echo "$out" | cut -c1-220 | sed 's/^/    /'; hits=1; }
  done
  return $hits
}
echo "  optional/ (trial skills, must be clean):"
if scan "$PACK/optional"; then echo "    clean"; else echo "  FAIL red flags in optional/"; fail=1; fi
echo "  core/ (review only; known, documented items are expected here):"
scan "$PACK/core" && echo "    clean"
echo "  network hosts referenced by optional/ scripts (info):"
grep -rhoIE 'https?://[a-zA-Z0-9.-]+' "$PACK"/optional/*/scripts "$PACK"/optional/*/*/scripts 2>/dev/null \
  | sed -E 's#https?://##' | sort | uniq -c | sort -rn | sed 's/^/    /'

echo "== 4. gitleaks"
GL="${GITLEAKS:-$(command -v gitleaks || true)}"
if [ -n "$GL" ]; then
  if "$GL" detect --no-git --source "$PACK" --no-banner --redact -v >/tmp/gl-pack.txt 2>&1 \
     && "$GL" detect --no-git --source scripts --no-banner --redact >/tmp/gl-scripts.txt 2>&1; then
    echo "  clean (vendor/design, scripts)"
  else
    echo "  FAIL gitleaks findings:"; sed 's/^/    /' /tmp/gl-pack.txt /tmp/gl-scripts.txt | tail -40; fail=1
  fi
else
  echo "  SKIP gitleaks not found (set GITLEAKS=/path/to/gitleaks)"
fi

[ "$fail" = 0 ] && echo "ALL CHECKS PASSED" || echo "CHECKS FAILED"
exit $fail
