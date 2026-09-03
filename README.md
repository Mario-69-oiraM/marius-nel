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
deploy/CNAME          custom domain, prepared but not active (see the runbook)
docs/deploy-runbook.md  how this is hosted, published and cut over
scripts/verify-site.sh  publish gate — asserts the HTML renders without JS
```

No build step, no package manager, no framework. Edit the HTML and push.

## Running locally

```sh
python3 -m http.server 8000
# then open http://localhost:8000
```

Opening `index.html` directly with `file://` also works.

## Before pushing

```sh
./scripts/verify-site.sh
```

Checks the served HTML for a real `<title>`, `<meta description>`, canonical and
`og:` tags, an absolute `og:image`, reachable assets, and at least 300 words of
content present **without JavaScript**. That last check is the point of the whole
rebuild — the Notion page it replaces served 15 words and the title "Notion".

Pass a URL to check a deployment instead of the working tree:

```sh
./scripts/verify-site.sh https://mario-69-oiram.github.io/marius-nel/
```

## Deployment

Pages is **not enabled on this repository yet**, so the site is committed to
`main` but published at no URL. Enabling it is a repository-settings change that
only the owner can make in the web UI — our PAT gets 403 on the Pages and
Actions REST APIs, so it cannot be scripted.

The method is **Pages "Deploy from a branch"** (`main` / `/ (root)`), not
Pages-via-Actions, for that same reason. Once it is on, publishing is just
`git push` to `main`; `.nojekyll` makes Pages serve the files verbatim.

Two things gate going live, both owner decisions:

1. The repository is **private**, and Pages on a private repo needs a paid plan.
   On the Free plan it has to be made public first.
2. The domain cutover takes `www.marius-nel.com` off Notion, so it happens only
   on the user's explicit approval. `deploy/CNAME` is prepared for it and is
   parked outside the repository root on purpose — a custom domain makes Pages
   redirect the `*.github.io` staging URL, which would break the preview before
   anyone has reviewed it.

Full steps, the recorded pre-cutover DNS, and the rollback are in
[`docs/deploy-runbook.md`](docs/deploy-runbook.md).

## Content sources

Copy, career timeline, skills narratives and the technology list were carried
over from the Notion site. The headshot is the original image from that page.
