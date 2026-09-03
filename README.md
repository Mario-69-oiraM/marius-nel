# marius-nel.com

Personal site for Marius Nel — a static, dependency-free rebuild of the previous
Notion-hosted page, served from GitHub Pages.

## Structure

```
index.html            single-page site (hero, highlights, timeline, skills, technology, contact)
404.html              not-found page
robots.txt            crawler directives
sitemap.xml           single-URL sitemap
.nojekyll             serve files verbatim; skip Jekyll processing
assets/css/site.css   all styles — design tokens, light/dark themes, print styles
assets/js/site.js     theme toggle, mobile nav, scroll spy (no dependencies)
assets/img/           headshot and favicon
```

No build step, no package manager, no framework. Edit the HTML and push.

## Running locally

```sh
python3 -m http.server 8000
# then open http://localhost:8000
```

Opening `index.html` directly with `file://` also works.

## Deployment

**GitHub Pages is not enabled on this repository yet.** The site is committed to
`main` but is not published at any URL. Turning it on is a repository-settings
change that has to be made by the repository owner in the GitHub web UI — it
cannot be done from a checkout.

### Step 1 — publish the site

The repository is currently **private**. GitHub Pages on a private repository
requires a paid plan (Pro, Team, or Enterprise); on the Free plan, Pages is only
available for public repositories. So either:

- make the repository public (**Settings → General → Danger Zone → Change
  visibility**), or
- confirm the account is on a paid plan.

Then: **Settings → Pages → Build and deployment → Source: Deploy from a branch →
Branch: `main` / `/ (root)` → Save**.

No build step or workflow is needed — `.nojekyll` makes Pages serve the files
verbatim. After a minute the site is live at
`https://mario-69-oiram.github.io/marius-nel/`, and every later push to `main`
republishes it.

Note that on that default URL the site lives under a `/marius-nel/` subpath. The
page uses relative asset paths, so it renders correctly there; only the absolute
`og:`/canonical URLs point at the custom domain, and those become correct once
step 2 is done.

### Step 2 — point www.marius-nel.com at this site

The domain still resolves to the Notion-hosted page. To move it:

1. Add a `CNAME` file at the repository root containing `www.marius-nel.com`.
2. In **Settings → Pages → Custom domain**, enter `www.marius-nel.com`.
3. At the DNS provider, replace the Notion record with a `CNAME` for `www`
   pointing at `mario-69-oiram.github.io`.
4. Wait for the certificate to issue, then enable **Enforce HTTPS**.

These steps are deliberately not done yet — they take the live domain off Notion,
which is a cutover the owner should time deliberately. Until then Notion keeps
serving the domain and nothing breaks.

## Content sources

Copy, career timeline, skills narratives and the technology list were carried
over from the Notion site. The headshot is the original image from that page.
