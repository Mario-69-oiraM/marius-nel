# Deploy runbook — marius-nel.com

Hosting, publishing and the domain cutover. Written for the repository owner;
the steps marked **owner-only** cannot be done from a checkout.

Verified 2026-09-03 and re-verified against the live staging URL several times
the same day, and again on 2026-09-04 — `./scripts/verify-site.sh` PASS on each,
780 no-JS words, all assets reachable. `./scripts/check-domain.sh` on 2026-09-04
still reports `CNAME -> external.notion.site` and Notion serving, which is the
expected pre-cutover state. Nothing has regressed.

`./scripts/check-domain.sh` was added on the last of those passes to cover the
half of step 2 that markup checks cannot reach — DNS, TLS and HTTPS
enforcement. See "Verifying the cutover" below.

**Current state: the site is live on the staging URL.** Pages is enabled and
serving <https://mario-69-oiram.github.io/marius-nel/>. The only step left is
the domain cutover in step 2, which waits on the user's explicit go. The live
domain `www.marius-nel.com` is still served by Notion and is untouched.

Everything NEXAA-48 asked for — repo, static site, publish pipeline, prepared
custom domain, staging URL — is in place. The cutover is deliberately *not* part
of that scope: it is owner-only and gated on the user's approval, and it belongs
to the parent review, NEXAA-45.

## Why the domain is still on Notion

Asked on NEXAA-45, 2026-09-03. Three reasons, in order of what actually blocks:

1. **It needs the owner's explicit go.** Repointing `www.marius-nel.com` is a
   change to a live, external-facing domain. The standing constraint is that
   nothing external-facing ships without that approval, and it has not been
   given. This is the only real blocker.
2. **It is owner-only regardless.** The DNS record lives in the registrar, not
   in this repo, and this team's PAT is refused by the Pages API (403, table
   below). Neither half of the cutover can be executed from a checkout.
3. **Board writes have been failing.** `paperclip.fixlink.org` does not resolve
   from this machine (NXDOMAIN, confirmed against 1.1.1.1 as well), so status
   comments written on earlier heartbeats never landed on the issue. The work
   was done; the reporting of it was not visible. That is why this looks stalled.

Re-measured 2026-09-03: staging URL 200 and `verify-site.sh` PASS;
`check-domain.sh` reports `CNAME -> external.notion.site`, still serving Notion.

## Deployment method: branch deploy, not Actions

**Use Pages "Deploy from a branch" (`main` / `/ (root)`). Do not use
Pages-via-Actions.**

The PAT available to this team can push code and open PRs, but it is not
authorised for the Actions or Pages REST APIs. Probed directly against
`Mario-69-oiraM/marius-nel`:

| Probe | Result |
| --- | --- |
| `GET /repos/{repo}` | 200 |
| `GET /repos/{repo}/deployments` | 200 |
| `POST /repos/{repo}/pages` | **403** `Resource not accessible by personal access token` |
| `GET /repos/{repo}/pages` | **403** |
| `GET /repos/{repo}/pages/builds` | **403** |
| `GET /repos/{repo}/actions/permissions` | **403** |
| `GET /repos/{repo}/actions/workflows` | **403** |
| `git push` of any `.github/workflows/*.yml` | **rejected** `refusing to allow a Personal Access Token to create or update workflow ... without 'workflow' scope` |

Three consequences:

1. Pages cannot be *enabled* from here. The `POST` to create the Pages site was
   attempted directly and returned 403 — this is measured, not inferred. It has
   to be switched on in the web UI, once, by the owner.
2. A Pages-via-Actions setup could not be monitored or debugged by this team —
   we cannot read run status or logs. Branch deploy has no such dependency.
3. **There can be no GitHub Actions CI on this repository at all** while this is
   the only credential. The blocker is not just the REST API: the PAT lacks the
   `workflow` scope, so the remote refuses the *push* of a workflow file. A CI
   gate cannot be committed, let alone run. This is why the publish gate is
   enforced by a local pre-push hook instead — see "The gate" below.

Branch deploy is also simply the right fit: the site is plain HTML/CSS/JS with
no build step, so there is nothing for a workflow to do. `.nojekyll` at the repo
root makes Pages serve the files verbatim. After the one-time enable, **every
push to `main` republishes the site** — that is the whole pipeline.

## Step 0 — repository visibility — DONE

This was previously a blocker: Pages on a private repository requires a paid
plan, and the repo was private. It has since been made public, so Pages serves
it on the Free plan.

Confirmed 2026-09-03 with an unauthenticated call (no token, so it reflects what
the public internet sees):

```
GET https://api.github.com/repos/Mario-69-oiraM/marius-nel  → 200
  "private": false, "visibility": "public", "has_pages": true
```

The repository holds only the site's own content — no credentials, no private
data — so nothing sensitive was exposed by this.

## Step 1 — enable Pages (owner-only, one time) — DONE

Done via Settings → Pages → Build and deployment (Source: **Deploy from a
branch**, branch **`main`**, folder **`/ (root)`**, custom domain left empty).

**The staging URL is live:**

```
https://mario-69-oiram.github.io/marius-nel/
```

That is the URL to review before deciding on the cutover. The page uses relative
asset paths, so it renders correctly under the `/marius-nel/` subpath. Only the
absolute `canonical`/`og:` URLs point at `www.marius-nel.com`; those become
correct at cutover and are harmless in the meantime.

Verified against the live URL on 2026-09-03, serving commit `8ea2df4`:

```sh
$ ./scripts/verify-site.sh https://mario-69-oiram.github.io/marius-nel/
  title        Marius Nel — Software Engineering Leader
  description  Marius Nel — engineering leader across South Africa, Australia and the...
  words no-JS  780
  assets       all reachable
PASS
```

That 780-word no-JS figure is the acceptance bar for this work: the gate reads
raw bytes without executing any JavaScript, so it is measuring what a crawler or
link-preview bot actually receives. The equivalent number for the current Notion
site is 15 words with no canonical link.

Also checked on the live URL, all green:

| Check | Result |
| --- | --- |
| TLS certificate | valid (`ssl_verify_result=0`) on the `github.io` domain |
| `/` | 200, no redirect (custom domain correctly still unset) |
| `/no-such-page` | 404, serves `404.html` |
| `/assets/img/og-card.jpg` | 200, `image/jpeg`, 87 KB — a real card, not a placeholder |
| `/robots.txt`, `/sitemap.xml`, `/.nojekyll` | 200 |

## Sequencing: do not set the custom domain early

`deploy/CNAME` holds the prepared custom-domain file. It is deliberately parked
under `deploy/` and **not** at the repository root.

The reason is a trap worth stating explicitly: once Pages has a custom domain,
it **301-redirects the `*.github.io` URL to that domain**. Set the custom domain
before the DNS switch and the staging URL stops showing the new site — it
redirects to `www.marius-nel.com`, which still resolves to Notion. The preview
would silently appear to have failed.

So the custom domain goes on at cutover, together with DNS — not before.

## Step 2 — the cutover (owner-only, needs explicit approval)

This takes the live domain off Notion. Do it only on the user's explicit go.

**Pre-cutover state, recorded 2026-09-03 for rollback:**

| Record | Current value |
| --- | --- |
| `www.marius-nel.com` CNAME | `external.notion.site` |
| `marius-nel.com` A | `3.33.130.190`, `15.197.148.33` |
| Nameservers | `ns17.domaincontrol.com`, `ns18.domaincontrol.com` (GoDaddy) |

DNS is at GoDaddy. Order of operations:

1. **A few hours ahead**, lower the TTL on the existing `www` record (to 600s if
   GoDaddy allows it). This is what makes rollback fast rather than a day-long
   wait. Skipping it is the single most common way a cutover becomes painful.
2. Move `deploy/CNAME` to the repository root and push:
   ```sh
   git mv deploy/CNAME CNAME && git commit -m "Point Pages at www.marius-nel.com" && git push
   ```
   Pages reads the root `CNAME` file and sets the custom domain from it.
3. At GoDaddy, change the `www` record from `external.notion.site` to
   `mario-69-oiram.github.io` (still a `CNAME`).
4. Wait for GitHub to issue the Let's Encrypt certificate — Settings → Pages
   shows the progress. This usually takes minutes but is allowed up to an hour.
   It will not start until DNS resolves to GitHub.
5. Once the certificate is issued, tick **Enforce HTTPS**. Doing this before the
   certificate exists makes the site unreachable, so wait for the green state.
6. Verify — **domain first, then content**:
   ```sh
   ./scripts/check-domain.sh          # DNS, TLS, HTTPS enforcement
   ./scripts/verify-site.sh https://www.marius-nel.com/
   ```

The apex `marius-nel.com` is out of scope here and keeps pointing at Notion. If
it should follow later, it needs GitHub's four A records
(`185.199.108.153`, `.109.153`, `.110.153`, `.111.153`) rather than a CNAME.

**Rollback:** set the `www` CNAME back to `external.notion.site`. Notion still
serves the content throughout — nothing is deleted at the Notion end by any of
this — so rollback is a DNS change only, and it takes effect within the TTL set
in step 1.

## Verifying the cutover

`verify-site.sh` answers "is the HTML right?". It follows redirects and does not
look at DNS, so on its own it cannot tell a working cutover from a domain that
still points somewhere else. `check-domain.sh` covers that other half:

```sh
./scripts/check-domain.sh                  # defaults to www.marius-nel.com
```

It is safe to run at any time and needs no credentials. Three outcomes:

| Verdict | Meaning | Exit |
| --- | --- | --- |
| `NOT CUT OVER` | `www` still CNAMEs to Notion — **the expected state today** | 0 |
| `CUT OVER — PASS` | points at Pages, TLS valid, HTTPS enforced, canonical matches | 0 |
| `CUT OVER — INCOMPLETE` | points at Pages but something is wrong, listed per line | 1 |

Run today it reports the pre-cutover state, which is also how the rollback
values in the table above stay honest:

```
$ ./scripts/check-domain.sh
Checking www.marius-nel.com
  dns          CNAME -> external.notion.site
  serving      Notion — the cutover has not happened

NOT CUT OVER
```

The checks it makes that nothing else does:

- **DNS type and target.** A CNAME to `mario-69-oiram.github.io` is the only
  correct answer; an A record here means the GoDaddy record was replaced with
  the wrong type, which fails in confusing ways later.
- **TLS actually issued.** Step 2.4 waits on Let's Encrypt. This reports the
  certificate's issuer and expiry rather than leaving you to read the Pages UI.
- **HTTPS enforced.** Plain `http://` must 301 to `https://`. If it answers 200,
  "Enforce HTTPS" (step 2.5) has not been ticked and the script says so.
- **No redirect off the host, and canonical matches.** Both catch the case where
  the domain resolves to GitHub but the site being served is not this one — the
  failure that looks fine in a browser and quietly tells search engines to keep
  indexing the old site.

The post-cutover paths were exercised before the cutover by pointing the script
at `pages.github.com` and `blog.github.com` — two real Pages custom domains, one
healthy and one that redirects away — which returned `CUT OVER — PASS` and
`CUT OVER — INCOMPLETE` respectively. So the green path is known to be reachable
and is not just an untested branch waiting for the day it matters.

One consequence of the cutover worth remembering: once Pages has a custom
domain, the staging URL 301s to it, so `verify-site.sh` against
`mario-69-oiram.github.io/marius-nel/` will from then on be measuring the live
site, not staging.

## Step 3 — publishing after cutover

Push to `main`. That is it. Pages rebuilds within a minute.

## The gate

Because a push to `main` *is* the deploy, and because Actions is unavailable to
us (see the table above), the gate runs client-side as a `pre-push` hook. Hooks
are checked into `.githooks/` so they are reviewable; `core.hooksPath` is local
config, so **every clone has to run this once**:

```sh
./scripts/install-hooks.sh
```

After that, pushes that touch published files (`*.html`, `assets/`, `robots.txt`,
`sitemap.xml`, `CNAME`, `.nojekyll`) run `scripts/verify-site.sh` first and abort
on failure. Docs-only pushes skip it. The escape hatch is `git push --no-verify`.

The gate reads raw bytes and never executes JavaScript, so it fails if the page
ever regresses into a JS-rendered shell — the specific failure this whole
migration exists to fix. Against the current Notion site it reports 15 words and
a missing canonical link; against this repository, 780 words and a full set of
metadata.

Verified 2026-09-03 against all three paths: docs-only push skips the gate, a
push touching `index.html` runs it and passes, and replacing `index.html` with a
JS-only shell (`<title>Notion</title>`, one word of text) blocks the push.

Being client-side, the hook is advisory rather than enforced — it cannot stop
someone who has not installed it. That is the ceiling of what this credential
allows. If a server-side gate is wanted later, it needs a PAT with `workflow`
scope, which is a credential change for the CTO to weigh, not something this
repository can fix.

## Cost

$0/month. Public repository plus GitHub Pages plus a Let's Encrypt certificate
issued by GitHub. The domain registration at GoDaddy is a pre-existing cost and
is unchanged by any of this.
