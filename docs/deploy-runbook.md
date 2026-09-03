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
