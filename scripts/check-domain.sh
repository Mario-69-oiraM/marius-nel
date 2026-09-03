#!/usr/bin/env bash
# Cutover check for the custom domain.
#
# verify-site.sh answers "is the HTML right?". This answers the other half:
# "is the domain pointed at us, is TLS real, and is HTTPS enforced?" — the
# transport-level things that only become true at cutover and that no amount
# of checking the markup will catch.
#
#   ./scripts/check-domain.sh                      # www.marius-nel.com
#   ./scripts/check-domain.sh www.example.com
#
# Safe to run at any time. Before the cutover it reports NOT CUT OVER and
# exits 0 — that is the expected state today, not a failure. It exits non-zero
# only when DNS points at GitHub but something about the setup is broken.

set -euo pipefail

HOST="${1:-www.marius-nel.com}"
# Overridable so the post-cutover path can be exercised against another host
# before the real one exists.
PAGES_HOST="${PAGES_HOST:-mario-69-oiram.github.io}"
NOTION_HOST="${NOTION_HOST:-external.notion.site}"

echo "Checking $HOST"

# --- DNS -------------------------------------------------------------------
# Only a CNAME tells us who serves the name; an A record here would mean the
# GoDaddy record was replaced with the wrong type.
TARGET=""
if command -v dig >/dev/null 2>&1; then
  CNAME=$(dig +short CNAME "$HOST" 2>/dev/null | sed 's/\.$//' | head -1 || true)
  ADDRS=$(dig +short A "$HOST" 2>/dev/null | grep -E '^[0-9.]+$' | tr '\n' ' ' || true)
  if [ -n "$CNAME" ]; then
    TARGET="$CNAME"
    echo "  dns          CNAME -> $CNAME"
  elif [ -n "$ADDRS" ]; then
    echo "  dns          A -> ${ADDRS% }"
  else
    echo "  dns          no CNAME or A record"
  fi
else
  echo "  dns          skipped (dig not installed)"
fi

case "$TARGET" in
  *"$PAGES_HOST"*) STATE=github ;;
  *"$NOTION_HOST"*|*notion*) STATE=notion ;;
  "") STATE=unknown ;;
  *) STATE=other ;;
esac

if [ "$STATE" = notion ]; then
  echo "  serving      Notion — the cutover has not happened"
  echo
  echo "NOT CUT OVER (expected: the switch is the user's call, see docs/deploy-runbook.md)"
  exit 0
fi

if [ "$STATE" != github ]; then
  echo "  serving      unrecognised — expected a CNAME to $PAGES_HOST"
  echo
  echo "NOT CUT OVER (nothing to verify yet)"
  exit 0
fi

# --- From here on the domain claims to be ours, so failures are real. ------
FAILURES=()

# TLS. curl verifies the chain by default, so a non-zero verify result means
# the Let's Encrypt certificate has not been issued yet (runbook step 2.4).
TLS=$(curl -sS -o /dev/null -w '%{ssl_verify_result}' "https://$HOST/" 2>/dev/null || echo fail)
if [ "$TLS" = "0" ]; then
  echo "  tls          certificate valid"
else
  echo "  tls          NOT valid (curl ssl_verify_result=$TLS)"
  FAILURES+=("TLS certificate is not valid — wait for GitHub to issue it before enforcing HTTPS")
fi

if command -v openssl >/dev/null 2>&1; then
  CERT=$(openssl s_client -connect "$HOST:443" -servername "$HOST" </dev/null 2>/dev/null \
         | openssl x509 -noout -issuer -enddate 2>/dev/null || true)
  ISSUER=$(printf '%s\n' "$CERT" | sed -n 's/^issuer=.*CN *= *//p' | head -1)
  EXPIRY=$(printf '%s\n' "$CERT" | sed -n 's/^notAfter=//p' | head -1)
  [ -n "$ISSUER" ] && echo "  cert issuer  $ISSUER"
  [ -n "$EXPIRY" ] && echo "  cert expires $EXPIRY"
fi

# HTTPS enforcement. Without -L so we see the redirect itself, not its target.
HTTP_CODE=$(curl -sS -o /dev/null -w '%{http_code}' "http://$HOST/" 2>/dev/null || echo 000)
HTTP_LOC=$(curl -sSI "http://$HOST/" 2>/dev/null | sed -n 's/^[Ll]ocation: *//p' | tr -d '\r' | head -1 || true)
case "$HTTP_CODE" in
  301|302|308)
    if [ "${HTTP_LOC#https://}" != "$HTTP_LOC" ]; then
      echo "  http         $HTTP_CODE -> $HTTP_LOC"
    else
      echo "  http         $HTTP_CODE -> $HTTP_LOC (not https)"
      FAILURES+=("plain http redirects somewhere other than https://$HOST/")
    fi
    ;;
  200)
    echo "  http         200 — served over plain http, no redirect"
    FAILURES+=("Enforce HTTPS is off — tick it in Settings -> Pages")
    ;;
  *)
    echo "  http         HTTP $HTTP_CODE"
    FAILURES+=("plain http returned $HTTP_CODE")
    ;;
esac

# Where https actually lands. A redirect off the host means the custom domain
# is misconfigured, or we are looking at the old site through a forward.
FINAL=$(curl -sSL -o /dev/null -w '%{url_effective}' "https://$HOST/" 2>/dev/null || true)
echo "  final url    ${FINAL:-unreachable}"
case "$FINAL" in
  "https://$HOST/"|"https://$HOST") ;;
  "") FAILURES+=("https://$HOST/ is unreachable") ;;
  *)  FAILURES+=("https://$HOST/ redirects away to $FINAL") ;;
esac

# canonical must name this host, or search engines are told to index the old
# site. This is the one content check that only makes sense post-cutover.
CANON=$(curl -sSL "https://$HOST/" 2>/dev/null \
        | sed -n 's/.*rel="canonical"[^>]*href="\([^"]*\)".*/\1/p' | head -1 || true)
if [ -n "$CANON" ]; then
  echo "  canonical    $CANON"
  case "$CANON" in
    *"$HOST"*) ;;
    *) FAILURES+=("canonical points at $CANON, not $HOST") ;;
  esac
else
  FAILURES+=("no canonical link in the served HTML")
fi

echo
if [ ${#FAILURES[@]} -eq 0 ]; then
  echo "CUT OVER — PASS"
  echo "Now run: ./scripts/verify-site.sh https://$HOST/"
  exit 0
fi

for f in "${FAILURES[@]}"; do
  echo "  FAIL: $f"
done
echo
echo "CUT OVER — INCOMPLETE"
echo "Rollback is a DNS change only: set the www CNAME back to $NOTION_HOST."
exit 1
