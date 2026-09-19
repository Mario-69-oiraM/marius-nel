# marius-nel.com — audience, call to action, and final copy

NEXAA-47 · content deliverable · 3 September 2026 · Mike, Growth & Content

Source material read through the Notion connector: the published page
(`192ac30a…`), the `Site` index, the full `Skills` page (30 tiles), and
`Marius Nel Résumé Master` (last edited 12 July 2026). Nothing here is
published. Nothing goes live without the user's explicit approval.

---

## 0. Five questions, answerable in one reply

The copy in §3 is finished and buildable as written. These four answers change
specific lines rather than the structure, so the design work on NEXAA-45 does
not need to wait on them — the build does.

1. **Is the reader a hiring manager, or a consulting client?** I have written
   for a hiring manager (reasoning in §1). If it is a client, the CTA is
   unchanged and two lines swap.
2. **Availability line — publish it, and in these words?**
   *"Open to Director and Senior Engineering Manager roles — Seattle or
   remote."* This is the one genuinely new claim on the page and the only line
   I will not build without a yes.
3. **~~Which of the five conflicting numbers are right?~~ Now one, not five.**
   On 18 September I checked every figure against the résumé corpus in Notion
   (§4). Four of the five resolve on evidence and need nothing from Marius —
   in each case the outlier is the *site's own* copy, not the résumé. The one
   that genuinely needs him is **72 weeks → 3 days or 10 days**, because both
   are current and they may be two different metrics.
4. **US or Australian spelling?** §3 is written US-side because the reader in
   §1 is US-based; the current build is Australian. Trivially reversible.
5. **Name Echodyne in the title and preview, or not?** I left it out and kept
   the five strongest names; the build currently includes it. Both versions
   are written in §3 — pick one.

Nothing here is published, and nothing goes live without the user's explicit
approval.

---

## 1. The sentence

> **A hiring manager or recruiter who already has Marius's name — from an
> application, a referral, or LinkedIn — lands here to decide in about ninety
> seconds whether he is worth a conversation, and leaves having booked one.**

Two things follow from it, and they are the whole brief.

**Nobody arrives by search.** They arrive by name. So the page is not a
discovery page, it is a *verification* page. Its job is to confirm and
de-risk quickly, not to introduce. That is why the title and meta description
matter more than any body copy: they are what the link preview shows in the
LinkedIn message, the Slack DM, or the ATS note where the visit actually
starts.

**There is one action, and it is the calendar.** Email and LinkedIn are
fallbacks, not equals. Today the page offers Calendar and Contact as equal
weight in the sidebar and buries them above the fold in a narrow column; the
scheduling link is the only path that ends in a meeting on its own.

### The assumption behind this, which Marius should confirm

The Oracle role ran to 06/2026. There are four résumés tailored to named
requisitions dated July 2026 (Nordstrom, UKG, McKinstry). I have read that as
*actively looking for a senior engineering leadership role, US-based*, and
written the copy for a hiring reader.

If the primary reader is instead a **prospective consulting client**, the
sentence and the CTA do not change — it is still "book a call" — but two
things do: the outcome cards should lead with the 2023–24 security consulting
engagement rather than the Amazon provisioning work, and the availability line
in §3 changes wording. One swap, not a rewrite. Flag it and I will do it.

---

## 2. Collapsing the three sections

### What is wrong

"Career Highlights", "Skills" and "Technical Experience" all answer one
question — *is he any good?* — three times, in three registers, at increasing
length and decreasing usefulness. The reader gets the answer from the first
one and then has to wade through two more.

It is worse than it looks from the front page. "More skills…" opens onto
**thirty tiles**, and they are not thirty skills. `Coach`, `Coaching` and
`Mentoring` are the same anecdote about the same junior engineer, told three
times. `Collaborate` and `Collaboration` are the same MVP workshop story.
`Strategy`, `Strategies`, `Planning` and `Operational Excellence` are four
retellings of the MYOB go-to-market program. `Passion` says he is passionate.
Meanwhile "Technical Experience" lists roughly sixty technologies including
IBM Db2, Objective-C and Apache HBase — a junior résumé's inventory, on the
page of a man who ran a 53-person organisation.

### What replaces them

Three sections become **two**, plus one line.

| Today | Becomes | Answers |
|---|---|---|
| Career Highlights (5 metric bullets) | **Outcomes** — same five, one sentence each | *What has he produced?* |
| Skills (3 essays + 30 tiles) | **How I work** — 3 items, ~50 words each | *What is he like to hire?* |
| Technical Experience (7 blocks, ~60 items) | **one line inside How I work** | *Is he still technical?* |

The **Career Timeline** stays as its own section and is untouched by this
collapse. It answers a different question — *where has he been?* — and the
three-country arc is genuinely unusual. It earns its place.

### What gets cut, specifically

- **All thirty "More skills" tiles.** Not trimmed — cut, and the link with
  them. Nine of them are duplicates of the other twenty-one. The three that
  survive are already on the front page.
- **Six of the seven technology blocks.** Mobile development, data science and
  ML, and data-warehouse databases have no supporting evidence anywhere in the
  career history or the résumé. Listing Swift and Objective-C invites the one
  interview question he cannot answer well.
- **The "More Technology" link** — it dead-ends at a Notion login wall, as
  does "More skills…" and the "Skills" heading itself.
- **~150 words per skills essay, down to ~50.** The Communication essay spends
  its first sentence saying communication is important. All three do this.
- **The duplicate NAB entry.** "Service Delivery Manager" appears twice in the
  timeline with an "Integration Delivery Manager" between them. Collapse to
  one line.
- **The positioning quote as written.** "I possess a talent for…" is résumé
  voice — it asserts the thing instead of showing it. Replaced in §3.

Net: the same evidence, roughly 60% less text, and one clear action.

### What gets added — the one real gap

There is nothing on the page saying **what he wants**. A recruiter reading it
learns everything about the last twenty years and nothing about the next six
months. One line fixes that, and it is the highest-value addition on this
page. Copy is in §3; the wording needs Marius's confirmation before it goes
anywhere near a build.

---

## 3. Final copy

Ready to build. Where the existing static rebuild (`index.html`) already
carries a version of a line, this text supersedes it.

**A note on spelling.** The rebuild normalised to Australian English. Given
the reader named in §1 is a US hiring manager, I would switch to US spelling
(`organized`, `recognizing`, `defense`). Marius's call; the copy below is
written US-side and is trivially reversible.

---

### Page title

```
Marius Nel — Software Engineering Leader, Seattle
```

49 characters. Name first, because that is what the reader searched or
clicked. Role and city next, because those are the two facts a recruiter
checks before anything else.

### Meta description

```
Engineering leader, 20+ years across Amazon, AWS, Oracle Health, NAB and
MYOB. I build teams from scratch and take on the ones that are struggling.
```

147 characters. Names the employers, because in a link preview the employer
names do the credibility work faster than any adjective.

**On Echodyne.** The current build names Echodyne in both the hero lede and
the meta description; I have left it out of both above. That is a deliberate
call, not an oversight: five employer names is already at the limit of what a
reader parses in a preview snippet, and Amazon, AWS and Oracle Health are the
three that do the most work with a US hiring reader. Echodyne stays on the
page — it is the "defense technology" in the Career lede and keeps its
timeline entry. If Marius would rather it be named up front, this version
fits in 152 characters:

```
Engineering leader, 20+ years across Amazon, AWS, Oracle Health, Echodyne and
MYOB. I build teams from scratch and take on the ones that are struggling.
```

Swapping NAB out rather than adding a sixth name is the trade; NAB is the
oldest of the six.

### Open Graph

```
og:title        Marius Nel — Software Engineering Leader
og:description  Twenty years and three countries: Amazon, AWS, Oracle Health,
                MYOB, NAB. Still reviewing pull requests.
og:type         profile
```

The last line of the description is the differentiator, so it goes in the
preview. `og:title` and `og:type` in the current build already match this
exactly — no change needed on either.

**Leave `og:image` alone.** It already points at
`https://www.marius-nel.com/assets/img/og-card.jpg`, a real 1200×630 card with
matching `og:image:width`, `og:image:height` and `og:image:alt`. An earlier
draft of this document pointed it at the portrait JPEG; that would have been a
regression. The absolute URL is correct and should stay absolute — relative
`og:image` values are ignored by most crawlers.

The `og:image:alt` currently reads `…Amazon, AWS, Oracle Health, NAB.` It
should pick up the full employer list from the meta description — **add MYOB**
— so the alt and the visible copy agree.

---

### Hero

**H1**

```
Marius Nel
```

**Role line**

```
Software engineering leader · Seattle
```

**Lede**

> Twenty years building software teams across South Africa, Australia and the
> United States — most recently Oracle Health, and before that Amazon Alexa,
> AWS S3 and EC2. I build teams from scratch, and I take on the ones that are
> struggling.

**The line that does the work** (set apart, replacing the yellow callout)

> I still review pull requests and I still take on-call. I have never found a
> way to set the technical bar by proxy.

That sentence is the only thing on this page that a hundred other engineering
directors could not also write. It is supported throughout the résumé — PR
review on Oracle's identity paths, debugging authentication incidents with the
on-call rotation, writing the MYOB prototypes himself — so it is a claim the
evidence carries.

**Availability line** — *needs Marius's confirmation before build*

> Open to Director and Senior Engineering Manager roles — Seattle or remote.

**Call to action**

```
[ Book 30 minutes ]   marius@nel.id.au   LinkedIn
```

Primary button, then two text links. Not three equal buttons. "Book 30
minutes" beats "Book time with me" because it tells the reader the size of the
commitment, which is the thing that stops people clicking.

---

### Section: Outcomes

**Heading**

```
Outcomes
```

**Lede**

> Five things worth knowing, with the numbers attached.

**Cards**

**$171M**
**Provisioning automation — Amazon EC2**
Cut new hardware provisioning from 127 days to 5, across 21,000+ assets
worldwide.

**72 weeks → 10 days**
**Go-to-market — MYOB**
A four-year program that consolidated 27 products into 15 and took cloud
infrastructure spend from $11M to $7M.

**Under 9 months**
**ISO 27001 — MYOB**
Certification for Australian Tax Office integration, on a four-pillar risk
framework the external auditor commended.

**75 zones**
**Global network monitoring — Amazon**
Delivered 17% under budget. New site provisioning went from 4 weeks to 1.5
days, and the work produced 5 patents.

**+27% YoY**
**Alexa subscription growth**
Traced the drop to intent-routing defects in the language model — routing
accuracy up 31%. Grew the team 57% and held attrition under 2%.

---

### Section: How I work

**Heading**

```
How I work
```

**Hands-on**

> I read the code. At Oracle I peer-reviewed pull requests on the identity and
> access-certification paths and debugged production authentication incidents
> with the on-call rotation. At MYOB I wrote the first prototypes of the
> observability and security automation platforms, then handed them to the
> teams that own them now.

**Turnarounds**

> I took over an S3 team after a 17-month leadership gap — twelve competing
> workstreams and flat engagement. We reprioritized with stakeholders, paired
> senior engineers with junior ones, and cut the workstream count. Engagement
> up 26%; 87% of the mid-year roadmap delivered.

**Growing people**

> Engagement from 63% to 87% at MYOB while the team went from 5 to 50. At
> Amazon, three SDE1s promoted to SDE2 and two SDE2s to SDE3 in two years; at
> Oracle, two engineers into tech-lead roles. I teach managers to review code
> themselves, so the bar holds when I am not in the room.

**Technology** — one line, closing the section

> Day to day: Python, Go, TypeScript, SQL, AWS, Postgres and DynamoDB. Twenty
> years of the rest — Java, C#, Oracle, Db2, Cassandra, Kafka — is on the
> résumé rather than here.

---

### Section: Career

**Heading**

```
Twenty years, three countries
```

**Lede**

> Networks, then code, then teams — telco, retail, banking, insurance,
> hyperscale cloud, health, and defense technology.

Structure and entries as already built, with three corrections:

1. **Collapse the duplicate NAB entry.** One line:
   `Service Delivery Manager, then Integration Delivery Manager — NAB`.
2. **Decipha (Melbourne, 2014–2016), Software Engineering Manager** is on the
   résumé and missing from the timeline. It is the $25M line-of-business role
   and the first time he scaled a team from 5. It should be in the Australia
   section.
3. **Oracle Health should carry its dates** (10/2024 – 06/2026). It is the
   most recent role and the one the reader cares most about; it currently sits
   undated at the bottom of a list.

---

### Section: Contact

**Heading**

```
Get in touch
```

**Lede**

> The calendar is the fastest route — pick a slot and it is booked. Email if
> that suits you better; I answer within a day.

**Cards**

```
Book 30 minutes    calendar.notion.so/meet/mariusnel/meet
Email              marius@nel.id.au
LinkedIn           in/marius--nel
```

---

### Footer

Keep the sign-off quote, set as type rather than trapped in the cover JPEG:

> Success extends beyond the software you deliver. It encompasses the value
> you provide, the transformations you initiate, and the lasting impact you
> generate.
>
> — Marius

It is short, it is his, and it is the only piece of voice on the page that is
not about work delivered.

---

## 4. Numbers that disagree with each other — resolved, except one

**Updated 18 September 2026.** The first version of this section listed five
conflicts and handed all five to Marius. That was more caution than the
evidence warranted. I have now checked each figure against the full résumé
corpus in Notion — roughly twenty tailored résumés, cover letters and dictated
notes spanning March to August 2026 — and **four of the five resolve on source
weight alone.**

| Claim | Live site | Résumé corpus | Verdict | Needs Marius? |
|---|---|---|---|---|
| Hardware assets | 210,000 | **21,000+**, unanimous across 14+ documents, Mar–Aug 2026 | **21,000+** | No |
| Site provisioning | *(not on site)* | **1.5 days**, unanimous Apr–Jul 2026; only a Skills tile says 3 | **4 weeks → 1.5 days** | No |
| Provisioning | 127 → 5 days | **127 → 5**, unanimous; only a Skills tile says 125 → 3 | **127 → 5 days** | No |
| Cloud cost | 37% | **$11M → $7M**, unanimous; "43%" appears attached to that same pair | **$11M → $7M** | No |
| Go-to-market | 72 weeks → 10 days | **3 days** *and* **10 days**, both current | **unresolved** | **Yes** |

**The pattern is the finding.** In every resolved row the outlier is the
site's own content — the published Notion page or a Skills tile — and the
résumés agree with each other. The site is the stale copy, not the source of
truth. `210,000` is a stray zero that exists nowhere else in twenty documents;
`125 → 3` and `4 weeks → 3 days` are Skills-tile drift. §3 already uses the
correct figure in all four cases, so no copy changes.

**On the 43%.** It is not a competing measurement, it is bad arithmetic:
$11M → $7M is a 36% reduction, and 43% would need $6.27M. The site's 37% is
simply that number rounded. Quoting the dollars, as §3 does, sidesteps a
percentage that is wrong in one of the two places it appears.

**The one that is real: 3 days or 10 days.** Both are live and neither is a
typo. `10 days` is the long-standing résumé line, in the April master and
still in the July requisition-tailored versions. `3 days` is in Marius's own
dictated June 2026 account — *"costs were reduced down to 7 million with a 3
days go to market"* — and in the newer highlight bullets. The likely
explanation is that these are **two different metrics**: that same June note
says *"reduced release cycles to 3 days"* one paragraph after using 3 days for
go-to-market, which is exactly what conflating a release cycle with an
idea-to-production cycle looks like. If that is right, the honest line is
*72 weeks → 10 days go-to-market*, with the 3-day release cadence as a separate
claim. **I am not making that call for him — it is his career, and the two
readings differ by more than 3×.** §3 uses 10 days, the conservative figure,
and is correct as written if he confirms.

---

## 5. Applied against the current build

The static rebuild in `index.html` carried the Notion content across close to
verbatim — all seven technology blocks, the three long Skills essays, the
"I possess a talent for…" quote and the `210,000` figure are all in it. So
every cut in §2 still applies as written. Line numbers are against
`index.html` at commit `8ea2df4`, re-verified 3 September 2026 — every anchor
below still matches. They will drift as NEXAA-45 edits the file, so match on
the quoted text rather than the number.

One thing the re-check surfaced: the current meta description is **208
characters**, so search results and link previews cut it off mid-sentence. The
replacement in §3 is 147. That makes the line-7 swap the highest-value single
edit in this table, not a cosmetic one.

| Line | Today | Change |
|---|---|---|
| 6 | `<title>Marius Nel — Software Engineering Leader` | append `, Seattle` |
| 7 | meta description | replace with §3 (see the Echodyne note) |
| 10 | `og:type` `profile` | **correct — no change** |
| 13 | `og:title` | **correct — no change** |
| 14 | `og:description` | replace with §3 |
| 17 | `og:image` absolute URL | **correct — no change** |
| 20 | `og:image:alt` | add `MYOB` to the employer list |
| 91 | eyebrow `Software Engineering Leadership` | → `Software engineering leader · Seattle` |
| 93–97 | hero lede | replace with §3 lede |
| 99–102 | `"I possess a talent for…"` pull quote | replace with the PR-review line in §3 |
| — | *(nothing)* | insert availability line — **holds for Marius's yes** |
| 107 | `Book time with me` | → `Book 30 minutes` |
| 109–116 | two ghost buttons, equal weight | demote to text links (design call, NEXAA-45) |
| 129–130 | eyebrow `Career Highlights` + `Outcomes, measured` | → `Outcomes` + §3 lede |
| 246–247 | eyebrow `Skills` + `How I lead` | → `How I work` |
| 250–266 | 3 essays, ~150 words each | replace with §3's three ~50-word items — the headings change too (`Communication / Growth / Customer Focus` → `Hands-on / Turnarounds / Growing people`), so this is a substitution, not a trim |
| 259 | `210,000` hardware assets | → `21,000+` — **now evidence-backed, not a judgement call**: 14+ résumé documents say 21,000+ and nothing says 210,000. See §4. |
| 272–328 | whole `#tech` section, 7 blocks | **delete**, replaced by the one Technology line at the end of How I work |
| 333–334 | eyebrow `✉️ Contact` + `Let's talk` | → `Get in touch` + §3 lede |
| 363 | footer quote | **keep as-is** |

**Timeline corrections** (§3, Career) — the duplicate NAB entry is worse than
the Notion page suggested: lines 201–203 are *three* consecutive NAB entries,
`Service Delivery Manager` / `Integration Delivery Manager` / `Service
Delivery Manager`. Collapse to one line. Oracle Health (line 233) is still
undated, and Decipha is still absent.

## 6. Handover

- **Product Designer (NEXAA-45):** the structure in §2 is what the design has
  to hold — hero with one primary button, five outcome cards, three "how I
  work" items with a technology line, timeline, contact. Two sections fewer
  than today.
- **Build:** §3 is final text and §5 is the diff to apply. Every change above
  is buildable now except the availability line.
- **Blocked on Marius:** the availability line, **one** number conflict
  (72 weeks → 3 or 10 days — the other four are settled in §4), US vs
  Australian spelling, whether Echodyne is named up front, and confirmation of
  the audience assumption in §1.
- **Not published.** Nothing here goes live without the user's explicit
  approval. `index.html` is deliberately untouched by this document — the open
  questions still change exact words, and this repo publishes on push. The
  `210,000` fix is now evidence-backed rather than a guess, but it ships with
  the rest of the §5 diff on his approval, not ahead of it.

## 7. Status, 18 September 2026

**The content work is done.** §1–§5 are the three deliverables the issue asked
for — the audience sentence, the section collapse, and final copy including
title and meta description. Nothing about them is outstanding, and nothing has
been outstanding since 3 September.

**What the issue waits on is Marius.** It was five questions; it is now four,
because §4 was re-checked against the Notion résumé corpus this run and four of
the five number conflicts resolved on evidence. The remaining four:

1. The availability line — the one genuinely new claim, and the only line that
   will not be built without a yes.
2. Go-to-market: 72 weeks → **3 days** or **10 days**. §4 has the case for each
   and the likely reconciliation.
3. US or Australian spelling.
4. Echodyne named in the title and link preview, or not — both versions written.

Plus the §1 audience assumption to confirm, which changes emphasis rather than
words. Until these land, applying the §5 diff would bake guesses into a page
that publishes on push.

**Control plane unreachable, second run running.** `paperclip.fixlink.org`
returns NXDOMAIN — the whole domain, not just the host — while the rest of the
internet resolves normally from this machine. So the issue thread could not be
read, the four questions could not be put to Marius as an interaction, and the
issue status could not be set. That is why this note is in the repo rather than
on the issue.

The consequence worth flagging: **the questions in §0 may never have reached
Marius.** They were written on 3 September and every run since that tried to
post them has hit this outage. If the thread turns out to be empty of them when
the control plane returns, the issue has been silently idle for two weeks, and
the first action on reconnection is to post them — not to resume drafting.
