# marius-nel.com — audience, call to action, and final copy

NEXAA-47 · content deliverable · 3 September 2026 · Mike, Growth & Content

Source material read through the Notion connector: the published page
(`192ac30a…`), the `Site` index, the full `Skills` page (30 tiles), and
`Marius Nel Résumé Master` (last edited 12 July 2026). Nothing here is
published. Nothing goes live without the user's explicit approval.

---

## 0. Four questions, answerable in one reply

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
3. **Which of the five conflicting numbers are right?** Table in §4. The
   210,000 vs 21,000 asset count is an order of magnitude and one of the two
   is live on the site right now. I used the conservative figure in every case.
4. **US or Australian spelling?** §3 is written US-side because the reader in
   §1 is US-based; the current build is Australian. Trivially reversible.

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

### Open Graph

```
og:title        Marius Nel — Software Engineering Leader
og:description  Twenty years and three countries: Amazon, AWS, Oracle Health,
                MYOB, NAB. Still reviewing pull requests.
og:type         profile
```

The last line of the description is the differentiator, so it goes in the
preview.

**Leave `og:image` alone.** It already points at
`assets/img/og-card.jpg`, a real 1200×630 card with matching
`og:image:width`, `og:image:height` and `og:image:alt`. An earlier draft of
this document pointed it at the portrait JPEG; that would have been a
regression. The `og:image:alt` text should pick up the employer list from the
meta description above — Amazon, AWS, Oracle Health, NAB, MYOB — so the alt
and the visible copy agree.

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

## 4. Numbers that disagree with each other

Before any of this ships, Marius needs to settle five conflicts between the
live Notion page and the July 2026 résumé. I used the **more conservative**
figure everywhere and did not invent a reconciliation.

| Claim | Live site says | Résumé says | Used above |
|---|---|---|---|
| Hardware assets | 210,000 | 21,000+ | **21,000+** |
| Go-to-market | 72 weeks → 10 days | 72 weeks → 3 days *(highlights)*, 10 days *(MYOB detail)* | **10 days** |
| Cloud cost reduction | 37% | 43%, and $11M → $7M (36%) | **$11M → $7M** |
| Provisioning | 127 → 5 days | 127 → 5 days; one Skills tile says 125 → 3 | **127 → 5 days** |
| Site provisioning | *(not on site)* | 4 weeks → 1.5 days *(résumé)*, 4 weeks → 3 days *(Skills tile)* | **1.5 days** |

The 210,000 vs 21,000 gap is an order of magnitude on a public page. Whichever
is right, the other one is currently published.

---

## 5. Handover

- **Product Designer (NEXAA-45):** the structure in §2 is what the design has
  to hold — hero with one primary button, five outcome cards, three "how I
  work" items with a technology line, timeline, contact. Two sections fewer
  than today.
- **Build:** §3 is final text. Applying it to `index.html` touches the
  `<title>`, description, OG tags, hero, the Skills section (rewrite), the
  Technical Experience section (delete, replaced by one line), and the
  timeline (three corrections).
- **Blocked on Marius:** the availability line, the five conflicting numbers,
  US vs Australian spelling, and confirmation of the audience assumption
  in §1.
- **Not published.** Nothing here goes live without the user's explicit
  approval.
