# Deploy runbook — marius-nel.com

Hosting, publishing and the domain cutover. Written for the repository owner;
the steps marked **owner-only** cannot be done from a checkout.

Verified 2026-09-03.

## Deployment method: branch deploy, not Actions

**Use Pages "Deploy from a branch" (`main` / `/ (root)`). Do not use
Pages-via-Actions.**

The PAT available to this team can push code and open PRs, but it is not
authorised for the Actions or Pages REST APIs. Probed directly against
`Mario-69-oiraM/marius-nel`:

| Endpoint | Result |
| --- | --- |
| `GET /repos/{repo}` | 200 |
| `GET /repos/{repo}/deployments` | 200 |
| `GET /repos/{repo}/pages` | **403** `Resource not accessible by personal access token` |
| `GET /repos/{repo}/pages/builds` | **403** |
| `GET /repos/{repo}/actions/permissions` | **403** |
| `GET /repos/{repo}/actions/workflows` | **403** |

Two consequences:

1. A Pages-via-Actions setup could not be monitored or debugged by this team —
   we cannot read run status or logs. Branch deploy has no such dependency.
2. Pages cannot be *enabled* via the API either. It has to be switched on in
   the web UI, once, by the owner.

Branch deploy is also simply the right fit: the site is plain HTML/CSS/JS with
no build step, so there is nothing for a workflow to do. `.nojekyll` at the repo
root makes Pages serve the files verbatim. After the one-time enable, **every
push to `main` republishes the site** — that is the whole pipeline.

## Blocker: the repository is private

`GET /repos/Mario-69-oiraM/marius-nel` reports `"private": true`. GitHub Pages
on a private repository requires a paid plan (Pro/Team/Enterprise). On the Free
plan, Pages only serves public repositories.

So before anything else, one of:

- **Make the repository public** — Settings → General → Danger Zone → Change
  visibility. This publishes the source, which is a public-facing change and
  needs explicit approval first. The repo holds only the site's own content —
  no credentials, no private data — so there is nothing sensitive in it.
- **Confirm the account is already on a paid plan**, in which case leave it
  private and skip straight to step 1.

## Step 1 — enable Pages (owner-only, one time)

Settings → Pages → Build and deployment:

- Source: **Deploy from a branch**
- Branch: **`main`**, folder **`/ (root)`**
- Save

**Leave "Custom domain" empty at this step.** See the sequencing note below.

After about a minute the staging URL is live:

```
https://mario-69-oiram.github.io/marius-nel/
```

That is the URL to review before deciding on the cutover. The page uses relative
asset paths, so it renders correctly under the `/marius-nel/` subpath. Only the
absolute `canonical`/`og:` URLs point at `www.marius-nel.com`; those become
correct at cutover and are harmless in the meantime.

Verify it:

```sh
./scripts/verify-site.sh https://mario-69-oiram.github.io/marius-nel/
```

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
6. Verify:
   ```sh
   ./scripts/verify-site.sh https://www.marius-nel.com/
   ```

The apex `marius-nel.com` is out of scope here and keeps pointing at Notion. If
it should follow later, it needs GitHub's four A records
(`185.199.108.153`, `.109.153`, `.110.153`, `.111.153`) rather than a CNAME.

**Rollback:** set the `www` CNAME back to `external.notion.site`. Notion still
serves the content throughout — nothing is deleted at the Notion end by any of
this — so rollback is a DNS change only, and it takes effect within the TTL set
in step 1.

## Step 3 — publishing after cutover

Push to `main`. That is it. Pages rebuilds within a minute.

Run the gate before pushing:

```sh
./scripts/verify-site.sh
```

It reads raw bytes and never runs JavaScript, so it fails if the page ever
regresses into a JS-rendered shell — which is the specific failure the whole
migration exists to fix. Against the current Notion site it reports 15 words and
a missing canonical link; against this repository, 780 words and a full set of
metadata.

## Cost

$0/month. Public repository plus GitHub Pages plus a Let's Encrypt certificate
issued by GitHub. The domain registration at GoDaddy is a pre-existing cost and
is unchanged by any of this.
