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

GitHub Pages serves the `main` branch from the repository root. Any push to
`main` republishes the site.

### Pointing www.marius-nel.com at this site

The domain currently resolves to the Notion-hosted page. To move it:

1. Add a `CNAME` file at the repository root containing `www.marius-nel.com`.
2. In **Settings → Pages → Custom domain**, enter `www.marius-nel.com`.
3. At the DNS provider, replace the Notion record with a `CNAME` for `www`
   pointing at `<owner>.github.io`.
4. Wait for the certificate to issue, then enable **Enforce HTTPS**.

Steps 1–4 are deliberately not done yet — they take the live domain off Notion.

## Content sources

Copy, career timeline, skills narratives and the technology list were carried
over from the Notion site. The headshot is the original image from that page.
