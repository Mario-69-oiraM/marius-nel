# Review of www.marius-nel.com (Notion) — 3 September 2026

Reviewed the live site, then rebuilt it as a static GitHub Pages site in this
repository. This document records what was found and what changed.

## Summary

The **content is strong** — quantified outcomes, a genuinely unusual three-country
career arc, and three well-written skills narratives. The **presentation was the
problem**. Almost every issue below is a consequence of hosting a personal brand
page on Notion rather than anything about the material itself.

## What was wrong

### 1. The page was invisible to search engines and link previews

The served HTML carried Notion's own metadata, not Marius's:

| Tag | Value served |
|---|---|
| `<title>` | `Notion` |
| `og:title` | `Notion \| Where teams and agents work together` |
| `og:description` | `A collaborative AI workspace, built on your company context…` |
| `og:url` | `https://app.notion.com` |
| `og:image` | `notion.com/images/meta/default.png` |

Sharing the URL in LinkedIn, Slack or iMessage produced a Notion advert. The
page's own `seo_description` was the single word `Skills`.

### 2. Content only existed after JavaScript ran

The initial HTML response was a ~20 KB shell; the actual content arrived from
`/api/v3/loadPageChunk`. Crawlers that don't execute JavaScript saw nothing, and
first paint was gated on the full Notion app bundle.

### 3. Layout was built from spacer columns and empty blocks

The page used empty columns (`ratio 0.125`, `0.16`) and runs of empty text blocks
as margins. The Contact page contained roughly eighteen consecutive empty
paragraphs. This kind of layout collapses unpredictably on narrow screens.

### 4. The career timeline was an unreadable Mermaid block

The timeline was a `mermaid` code block with a hard-coded pastel theme and mixed
tab/space indentation. Output was a wide diagram — not selectable, not
searchable, and effectively unusable on a phone. It also carried small errors
that a diagram hides well: `Myers` for **Myer**, `Software Development, Manager
Intelisys` (comma misplaced), inconsistent spacing around role and employer.

### 5. Navigation dead-ended in the Notion app

"Career Timeline", "Skills", "More skills…" and "More Technology" all linked to
`app.notion.com/p/<id>` URLs. A visitor without access to that workspace hits a
login wall. There was no real navigation between sections.

### 6. The best line on the site was trapped in an image

> "Success extends beyond the software you deliver. It encompasses the value you
> provide, the transformations you initiate, and the lasting impact you generate."

This was the cover image — a low-resolution 998×398 JPEG. Not selectable, not
indexable, not legible on a phone.

### 7. Smaller items

- No favicon of his own (Notion's).
- No `robots.txt`, no sitemap, no structured data.
- Technology list had typos: `C#. .Net`, `Purpose Languages` as a heading,
  `Python (NumPy, Pandas, TensorFlow, Scikit-learn)` mixing language and library.
- The transcluded skill blocks rendered as three unequal columns with a stray
  empty paragraph in the middle one.

## What the rebuild does

- **Static HTML, no build step and no dependencies.** One `index.html`, one CSS
  file, one JS file. Content is in the markup, so it is crawlable and renders
  immediately.
- **Correct metadata**: real `<title>`, description, canonical URL, Open Graph
  and Twitter cards using his own headshot, plus `Person` JSON-LD naming Amazon,
  AWS, Oracle Health and NAB.
- **Timeline as structured text**, grouped South Africa → Australia → United
  States, with sector sub-headings. Selectable, searchable, readable on a phone.
  Typos corrected (`Myer`, `Intelisys, ScanSource`), Oracle Health and Echodyne
  grouped under "Enterprise & Defence Technology".
- **Career highlights as five metric cards** leading with the number
  (`72 weeks → 10 days`, `127 days → 5 days`, `$171M`, `< 9 months`, `+35%`).
- **The sign-off quote set as type** in the footer instead of a JPEG.
- **Working contact paths** — `marius@nel.id.au`, the Notion scheduling link,
  and LinkedIn — as three cards rather than a separate page.
- **Light and dark themes** honouring `prefers-color-scheme`, with a toggle that
  persists, applied before first paint so there is no flash.
- **Accessibility**: skip link, landmarks, labelled controls, visible focus
  rings, `prefers-reduced-motion` respected.
- **Print stylesheet**, so the page prints as a clean one-page profile.

Verified at 390 px, 414 px and 1440 px in both themes; no horizontal overflow.

### The link preview, specifically

Almost nobody arrives here by search — they arrive by name, from a LinkedIn
message, a Slack DM or an application. The unfurled card is therefore the first
impression, not the hero.

`og:image` now points at a purpose-built **1200×630** card
(`assets/img/og-card.jpg`) carrying the name, the three-country line, the four
recognisable employers and the domain. It replaced the portrait: LinkedIn,
Slack and iMessage crop to 1.91:1, and the source portrait is 1690×1792 — a
tall image that loses the face to that crop. `og:image:width`/`height` are
declared so the first scrape renders at full size rather than as a thumbnail,
and `og:image:alt` describes it for screen readers. `twitter:image` is set
explicitly rather than relying on `og:` fallback.

The card is legible at the ~500 px width a real feed renders it at, which is
why it carries five short lines and not a paragraph.

## Editorial changes worth knowing about

Copy was tightened but no claim was changed. Specifically:

- Spelling normalised to Australian English (`organised`, `recognising`,
  `minimising`) to match the `.com.au`-adjacent audience and the original text's
  own mixed usage.
- "minimal viable product" → "minimum viable product".
- Employer names corrected as listed above.

Nothing was invented. Every number, employer and narrative on the new site comes
from the Notion source.

## The domain is frozen, by instruction

On 3 September 2026 the user's instruction on NEXAA-45 was:

> The domain name is not moving now first build the site before we repoint the
> DNS entry

So the cutover is off the table until the built site has been reviewed and
approved. `www.marius-nel.com` stays on Notion — re-checked against 1.1.1.1 the
same day, still `CNAME external.notion.site`, and nothing in this repo touches
DNS. Real visitors continue to see the Notion page, unchanged.

Publishing and cutover stay parked on **NEXAA-48**. Until the cutover lands, the
absolute `og:`/canonical URLs point at a domain the site does not yet serve
from — expected, and correct the moment the domain is cut over.

## Design QA of the built site — 3 September 2026

Ran against the live staging build, not the working tree.

| Check | Result |
|---|---|
| `https://mario-69-oiram.github.io/marius-nel/` | HTTP 200 |
| `verify-site.sh` | PASS — title, description, 780 words without JavaScript, all assets reachable |
| Horizontal overflow at 390 px | None. `documentElement.scrollWidth` = 390, viewport = 390 |
| Elements breaching the viewport | One — `a.skip-link` at `left: -9999px`, which is the intended off-screen pattern |

A note for anyone re-running this: screenshotting the page with headless
Chrome's `--window-size=390,…` produces a page that *looks* horizontally
clipped. It is an artefact — headless does not apply the mobile viewport meta,
so it lays out wide and crops. Measure `scrollWidth` from a same-origin iframe
sized to 390 px instead of trusting the image.

## Open design decisions — these need the user, not more building

None of these block looking at the site. All three change what it claims, so I
am not making them unilaterally.

1. **The career timeline carries no dates at all.** Nineteen roles, no years,
   no "present". A reader cannot tell whether this is a ten-year career or a
   thirty-year one, or which role is current — and recency and tenure are the
   first two things anyone scanning a career page looks for. The Notion source
   did not carry dates either, so adding them means sourcing them, not
   inferring them.
2. **NAB appears three times, with "Service Delivery Manager" repeated.** In
   the Australia column it reads Service Delivery Manager → Integration
   Delivery Manager → Service Delivery Manager, all NAB. If that is a real
   progression it needs distinguishing; if it is a duplicate from the Notion
   source it should be collapsed. Right now it reads as a rendering bug.
3. **Decipha (Melbourne, 2014–2016) is on the résumé and missing here.** Mike
   flagged it in `docs/content-nexaa-47.md` — the $25M line-of-business role
   and the first team scaled from five.

Items 2 and 3 are Mike's, from `docs/content-nexaa-47.md` § Career; item 1 is
mine. They are recorded together because they are one conversation with Marius,
not three.

Separately, the rewritten copy in `docs/content-nexaa-47.md` is still **not
applied to this page**. It proposes collapsing Career Highlights, Skills and
Technical Experience into two sections plus one line. That is a content
decision above my line.

The rewritten copy in `docs/content-nexaa-47.md` (Mike, Growth & Content) is
**not applied to this page**. It proposes collapsing Career Highlights, Skills
and Technical Experience into two sections plus one line. That is a content
decision above my line — it needs the user's call before I restructure the page
around it.

## Status check — 4 September 2026

Asked on NEXAA-45: where does this stand? Re-verified rather than recalled.

| | |
|---|---|
| Site built and live | Yes — `https://mario-69-oiram.github.io/marius-nel/`, HTTP 200 |
| `verify-site.sh` | PASS — 780 words render without JavaScript, all assets reachable |
| `www.marius-nel.com` | Still `CNAME external.notion.site` (208.103.161.18/.19). Real visitors see the Notion page |
| Cutover | Parked on NEXAA-48, deliberately, pending review of the built site |
| Copy rewrite (`docs/content-nexaa-47.md`) | Written, **not applied** — parked on NEXAA-47 |

The design work is done and reviewable. What is left is not building; it is
three decisions only Marius can make — the missing career dates, the tripled
NAB entry, and the missing Decipha role — plus a yes/no on applying the
rewritten copy. All four are stated in full in the section above.
