#!/usr/bin/env bash
# Publish gate for marius-nel.com.
#
# The whole point of moving off Notion is that the HTML a crawler receives must
# already contain the page. This script checks exactly that: it reads the raw
# bytes off the wire and never executes JavaScript.
#
#   ./scripts/verify-site.sh                 # check the local working tree
#   ./scripts/verify-site.sh https://host/   # check a deployed URL
#
# Exits non-zero on the first failure.

set -euo pipefail

MIN_WORDS=300
TARGET="${1:-}"
SERVER_PID=""

cleanup() { [ -n "$SERVER_PID" ] && kill "$SERVER_PID" 2>/dev/null || true; }
trap cleanup EXIT

if [ -z "$TARGET" ]; then
  cd "$(dirname "$0")/.."
  PORT=8931
  python3 -m http.server "$PORT" >/dev/null 2>&1 &
  SERVER_PID=$!
  sleep 2
  TARGET="http://127.0.0.1:$PORT/"
fi

echo "Verifying $TARGET"

BODY=$(mktemp)
CODE=$(curl -sL "$TARGET" -o "$BODY" -w '%{http_code}')
[ "$CODE" = "200" ] || { echo "FAIL: index returned HTTP $CODE"; exit 1; }

MIN_WORDS="$MIN_WORDS" python3 - "$BODY" <<'PY'
import html, os, re, sys

src = open(sys.argv[1], encoding="utf-8", errors="replace").read()
min_words = int(os.environ["MIN_WORDS"])
failures = []


def need(pattern, label):
    m = re.search(pattern, src, re.S | re.I)
    if not m or not m.group(1).strip():
        failures.append(f"missing {label}")
        return None
    return m.group(1).strip()


title = need(r"<title>(.*?)</title>", "<title>")
desc = need(r'name="description"\s+content="(.*?)"', "<meta name=description>")
need(r'rel="canonical"\s+href="(.*?)"', "canonical link")
need(r'property="og:title"\s+content="(.*?)"', "og:title")
need(r'property="og:description"\s+content="(.*?)"', "og:description")

# og:image must be absolute — relative values break link unfurling.
og_image = need(r'property="og:image"\s+content="(.*?)"', "og:image")
if og_image and not og_image.startswith("http"):
    failures.append(f"og:image is not absolute: {og_image}")

# The regression we are actually guarding against: a JS-rendered shell.
stripped = re.sub(r"<(script|style)[^>]*>.*?</\1>", "", src, flags=re.S | re.I)
words = html.unescape(re.sub(r"<[^>]+>", " ", stripped)).split()
if len(words) < min_words:
    failures.append(f"only {len(words)} words without JS (need >= {min_words})")

if title:
    print(f"  title        {title}")
if desc:
    print(f"  description  {desc[:70]}...")
print(f"  words no-JS  {len(words)}")

for f in failures:
    print(f"  FAIL: {f}")
sys.exit(1 if failures else 0)
PY

for path in assets/css/site.css assets/js/site.js assets/img/marius-nel.jpg \
            assets/img/og-card.jpg assets/img/favicon.svg robots.txt sitemap.xml; do
  CODE=$(curl -sL -o /dev/null -w '%{http_code}' "${TARGET%/}/$path")
  [ "$CODE" = "200" ] || { echo "  FAIL: $path returned HTTP $CODE"; exit 1; }
done
echo "  assets       all reachable"

echo "PASS"
