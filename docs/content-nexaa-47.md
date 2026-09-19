# marius-nel.com — audience, call to action, and final copy

NEXAA-47 · content deliverable · drafted 3 September 2026 · materially revised
19 September 2026 · settled calls from NEXAA-53 folded in 19 September 2026 ·
**final — Marius's last four answers folded in, 19 September 2026 (revision 3)**
· Mike, Growth & Content

Source material read through the Notion connector: the published page
(`192ac30a…`), the `Site` index, the `Site / Books` tree, the full `Skills`
page (30 tiles), `Marius Nel Résumé Master`, and the Iterum Works meeting and
notes databases through 18 September 2026. Nothing here is published. Nothing
goes live without the user's explicit approval.

---

## 0. Read this first — the premise changed

**Marius started a new job on about 8 September 2026.** He is **Director of
Software Engineering at Echodyne**, leading the **EchoWare** team. This is not
an inference; it is in his own words and corroborated four ways:

| Evidence | Date | What it says |
|---|---|---|
| Personal letter, Notes DB | 31 Aug 2026 | *"I am also starting a new role next week at a company called Echodyne."* Also: laid off from Oracle earlier in the year; started a business; self-published a book. |
| `my intro` bio questionnaire | 10 Sep 2026 | Job Title: **Director of Software Engineering**. Duties: *"Lead the Echoware team."* |
| 1:1 with Matt, on the **Outlook (Echodyne)** calendar | 17 Sep 2026 | *"Marius is about one week in."* Onboarding, laptop setup, GitLab migration, EchoWare/firmware team split. |
| Three intro 1:1s titled *"— Marius Nel — Director of Software Engineering"* | 18 Sep 2026 | Title confirmed in the meeting records themselves. |

**This invalidates the most consequential part of the 3 September draft, and it
would have put a false statement on a live page.** That draft was written for a
job-seeking reader and held one line for Marius's approval:

> ~~Open to Director and Senior Engineering Manager roles — Seattle or remote.~~

**That line is withdrawn. It must not be built, and it is no longer a question
for anyone to answer.** Publishing it would tell his new employer and his new
team, in week two, that he is looking to leave. It is the single most important
correction in this document.

Three further things the 3 September draft did not know:

1. **Echodyne is his employer, not a former one.** The old §3 argued for
   *dropping* Echodyne from the link preview in favour of NAB. That reasoning is
   now backwards — see §3.
2. **He is a published author, and the books are already on this site.**
   `Site / Books` holds a six-book series plus a 13-session *Lunch & Learn*
   curriculum. *From Code to Team — An Honest Playbook for New Engineering
   Leaders* is on Amazon (`B0HG67BG7Z`) and is now in a second edition. The
   front page does not mention any of it. This is the largest missed asset on
   the site and it changes what the page is for — see §1 and §3.
3. **He started a business** (Iterum Works) and runs a podcast season off the
   book. Neither appears on the page, and neither is added: the only place
   they could have gone was a 2026 line in the timeline, and Marius declined
   one (see below).

I did not go looking for this. It surfaced while checking the one remaining
number conflict from the last run. The lesson is the same one §4 already drew
about the metrics: **the site is the stale source.** It was stale about the
numbers; it is now eleven days stale about his job and about a book he wrote.

### Settled by Marius on NEXAA-53 (card `233c2a90`, 19 September, 02:38Z)

Four calls came back from the UX brief and are now folded into this document
as decisions, not proposals:

1. **Reader.** The §1 sentence is confirmed verbatim. The audience question is
   closed.
2. **Primary action.** Book button; email as a text link beside it; the
   calendar link moves down to Contact. Marius did **not** choose to keep the
   calendar in the hero. §3 hero and Contact reflect this.
3. **Outcome cards: four.** The Alexa card is cut. §2 and §3 now carry four.
4. **Word budget.** ~450 words *with* Books is fine, on one condition that
   Rosa (NEXAA-45) checks at build: at **1280×800, cold load**, the positioning
   line (*"I still review pull requests…"*) and the book button are both
   visible without scrolling. If Books pushes the hero down, **cut How I work
   before Books.** §3 marks the fallback.

### Settled by Marius on NEXAA-47 (card `d65d7886`, 19 September)

The last four questions came back on one card. All four are folded in below as
decisions:

1. **Meta description: Version B, employer-free.** The link preview and search
   snippet do not name Echodyne. The page body still does — hero lede and top
   of the timeline — which is what the question was always about: the cached,
   syndicated snippet, not the page. Consequences in §3: `og:image:alt` matches
   B's employer list, and the JSON-LD gets `jobTitle` but **no** `worksFor`.
2. **Go-to-market: 72 weeks → 10 days.** The Outcomes card is correct as
   written. The 3-day figure is a release-cycle number and is not on the page.
3. **Books 2–6: not published. Book 1 only.** The Books section names *From
   Code to Team* and treats everything else as companion material. Nothing is
   listed as available without a link.
4. **No line for 2026 between Oracle Health and Echodyne.** The timeline shows
   Oracle Health `10/2024 – 06/2026` and Echodyne `09/2026 – present`, dated,
   with nothing in between. The gap is visible and uncharacterized, and that is
   his call.

### What is still open, after this revision

**Nothing on the copy.** §3 is final. What remains is not a content question:

- **Approval to build.** The copy goes to Tess (NEXAA-55) for the `index.html`
  rewrite once the user approves this revision — that is the confirmation card
  on this issue. The DNS cutover to the live domain is a separate, later
  decision on NEXAA-55 and is not touched by this.
- **The fold check.** Rosa (NEXAA-45) checks at 1280×800 cold load that the
  positioning line and the book button are above the fold. If not, How I work
  is cut before Books. Marius set that condition on NEXAA-53.

**US vs Australian spelling is resolved** — US, see §4.

---

## 1. The sentence

The 3 September sentence named a hiring manager deciding whether Marius was
worth interviewing. He is not a candidate any more. Replacing it:

> **Someone who has just met Marius, or just read something he wrote, lands
> here to work out who he is — and leaves with the book, or with his email.**

**Confirmed verbatim by Marius on NEXAA-53, 19 September.** This is the brief.
Three things follow from it.

**Nobody arrives by search. They arrive by name — and now, increasingly, by
book.** This was already a verification page rather than a discovery page. What
has changed is who is verifying: a new colleague at Echodyne looking him up, an
engineer who sat through a Lunch & Learn, someone who bought *From Code to
Team* and followed the link. The `Site / Books` page opens with *"You can
download additional content for my books here"* — so book readers are already
arriving, and the front page gives them nothing and points at nothing.

**The page finally has something to give.** This is the real unlock. A profile
page whose only action is "book a call" is asking the reader for something. A
page that hands over a book and thirteen free session scripts is giving the
reader something, which is both better content strategy and a much better fit
for what NEXAA-46 settled: credibility and contact, not a funnel.

**The calendar should stop being the primary action.** In the old draft the
scheduling link was the one path that ended in a meeting, and that was right for
a job search. A sitting Director with a public "book 30 minutes" button is
inviting cold meetings he now has no room for. **Settled:** the book button is
the primary action, email is a text link beside it, and the scheduling link
moves down into the Contact section. Marius chose this on NEXAA-53 and did not
take the keep-calendar-in-hero option.

### What does *not* change

NEXAA-46's settlement holds exactly as written: this is Marius's personal
professional profile, for credibility and contact. Nothing here turns it into a
product page or a funnel, and the books are presented as his work rather than as
something being sold — Book 1 links to Amazon because that is where it is, and
everything else on the site is free.

---

## 2. Collapsing the three overlapping sections

*Verified against `index.html` on 3 September; Outcomes trimmed to four cards
on 19 September per NEXAA-53.*

### What is wrong

"Career Highlights", "Skills" and "Technical Experience" all answer one
question — *is he any good?* — three times, in three registers, at increasing
length and decreasing usefulness. The reader gets the answer from the first one
and then has to wade through two more.

It is worse than it looks from the front page. "More skills…" opens onto
**thirty tiles**, and they are not thirty skills. `Coach`, `Coaching` and
`Mentoring` are the same anecdote about the same junior engineer, told three
times. `Collaborate` and `Collaboration` are the same MVP workshop story.
`Strategy`, `Strategies`, `Planning` and `Operational Excellence` are four
retellings of the MYOB go-to-market program. `Passion` says he is passionate.
Meanwhile "Technical Experience" lists roughly sixty technologies including
IBM Db2, Objective-C and Apache HBase — a junior résumé's inventory, on the
page of a man who ran a 53-person organization.

### What replaces them

Three sections become **two**, plus one line — and one new section is added.

| Today | Becomes | Answers |
|---|---|---|
| Career Highlights (5 metric bullets) | **Outcomes** — four of the five, one sentence each (Alexa cut) | *What has he produced?* |
| Skills (3 essays + 30 tiles) | **How I work** — 3 items, ~50 words each | *What is he like to work with?* |
| Technical Experience (7 blocks, ~60 items) | **one line inside How I work** | *Is he still technical?* |
| *(nothing on the front page)* | **Books** — new, see §3 | *What can I take away?* |

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
- **The Alexa outcome card.** Cut on NEXAA-53 — four cards, not five. The
  numbers (+27% YoY, routing accuracy +31%, team +57%, attrition under 2%)
  stay in the résumé; they do not need a fifth card to make the point the
  other four already make.

Net: the same evidence, roughly 60% less text, one clear action, and one
section that gives the reader something instead of asking for something.

### Word budget — settled, with one build condition

Marius accepted **~450 words including Books**. The condition, which Rosa
checks on NEXAA-45 rather than me: at **1280×800 on a cold load**, the
positioning line and the book button must both be visible without scrolling.
If Books pushes the hero below that line, **cut How I work before Books.**

### What gets added

The 3 September draft said the one real gap was a line saying what he wants
next. That gap closed itself — he got the job. **The gap now is the books**,
and it is a much bigger one. A six-book series and a thirteen-session
curriculum are sitting two clicks down on a page nobody reaches, while the
front page spends 400 words listing database engines. Copy is in §3.

---

## 3. Final copy

Ready to build. No open questions — every decision that used to be marked
here is settled in §0. Where the existing static rebuild (`index.html`) already
carries a version of a line, this text supersedes it.

**Spelling: US.** Resolved on evidence rather than preference — see §4. The
current build is Australian and needs normalizing.

---

### Page title

```
Marius Nel — Software Engineering Leader, Seattle
```

49 characters. Deliberately *not* "Director of Software Engineering at
Echodyne": a title is the most expensive thing on the page to keep current, it
is what every existing link and bookmark shows, and it should survive his next
job change. The current role belongs in the body, where updating it is cheap.

### Meta description — **Version B, settled**

```
Engineering leader in Seattle. Twenty years building teams at Amazon, AWS,
Oracle Health and MYOB. Author of From Code to Team, a playbook for new leads.
```

147 characters. Marius chose the employer-free version on 19 September. The
reasoning, for the record: a link preview is cached and syndicated, so pinning
the current employer into it means every stale copy misstates where he works
the moment that changes; and Echodyne is a defense contractor under ITAR whose
disclosure posture is tightening, so naming it in a search snippet was his call
and his employer's. Version A (*"Director of Software Engineering at Echodyne.
Twenty years building teams at Amazon, AWS and Oracle Health. Author of From
Code to Team."*) is not chosen and should not be built.

This replaces the current line, which is **208 characters** and truncates
mid-sentence in every search result and link preview today.

**Echodyne still belongs on the page**, prominently, in the hero lede and at
the top of the timeline. The decision was only ever about the link preview.

### Open Graph

```
og:title        Marius Nel — Software Engineering Leader
og:description  Twenty years and three countries: Amazon, AWS, Oracle Health,
                MYOB. Now leading engineering at a radar company in Seattle.
                Still reviewing pull requests.
og:type         profile
```

The last line is the differentiator, so it stays in the preview. The middle
clause is the employer-free phrasing, consistent with Version B. `og:title` and
`og:type` in the current build already match — no change needed on either.

**Leave `og:image` alone.** It already points at
`https://www.marius-nel.com/assets/img/og-card.jpg`, a real 1200×630 card with
matching `og:image:width`, `og:image:height` and `og:image:alt`. The absolute
URL is correct and should stay absolute — relative `og:image` values are
ignored by most crawlers.

The `og:image:alt` currently ends `…Amazon, AWS, Oracle Health, NAB.` Replace
the whole attribute so it matches Version B:

```
Marius Nel — Software Engineering Leader. South Africa, Australia, United
States. Amazon, AWS, Oracle Health, MYOB.
```

### Structured data

The JSON-LD block lists `alumniOf` only. One change, and one deliberate
non-change:

- Change `"jobTitle"` from `"Software Engineering Leader"` to
  `"Director of Software Engineering"`. It names the role, not the employer.
- **Do not add `worksFor`.** It is the same disclosure as the meta description,
  and Version B was chosen. `alumniOf` stays as it is.

---

### Hero

**H1**

```
Marius Nel
```

**Role line**

```
Director of Software Engineering · Seattle
```

**Lede**

> I lead the EchoWare team at Echodyne, building the software layer across a
> radar platform. Before this: twenty years of engineering teams across South
> Africa, Australia and the United States — Oracle Health, Amazon Alexa, AWS S3
> and EC2. I build teams from scratch, and I take on the ones that are
> struggling.

Build the lede as written, Echodyne included. Version B of the meta
description removes the employer from the *snippet*, not from the page: naming
it in the body is normal, and the reader who has just met him already knows
where he works. The employer-free body variant offered in revision 2 is
dropped.

**The line that does the work** (set apart, replacing the yellow callout)

> I still review pull requests and I still take on-call. I have never found a
> way to set the technical bar by proxy.

That sentence is the only thing on this page that a hundred other engineering
directors could not also write. It is supported throughout — PR review on
Oracle's identity paths, debugging authentication incidents with the on-call
rotation, writing the MYOB prototypes himself — and the Lunch & Learn script
for Chapter 1 sets out the exact practice behind it, down to the two hours on
Wednesday afternoons. It is a claim the evidence carries.

**Call to action**

```
[ Read From Code to Team ]   marius@nel.id.au   LinkedIn
```

Primary button, then two text links. The scheduling link moves to the Contact
section. **Settled on NEXAA-53** — this is no longer a recommendation.

**Fold condition (Rosa, NEXAA-45):** at 1280×800 cold load, the *"I still
review pull requests…"* line and this button must both sit above the fold.

~~Availability line~~ — **withdrawn, see §0. Do not build.**

---

### Section: Outcomes

**Heading**

```
Outcomes
```

**Lede**

> Four things worth knowing, with the numbers attached.

**Cards** — four, settled on NEXAA-53. The Alexa card is cut.

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

~~**+27% YoY** — Alexa subscription growth~~ — **cut on NEXAA-53. Do not
build.**

---

### Section: How I work

**This is the section that goes if the fold condition fails.** If Books pushes
the positioning line or the book button below the fold at 1280×800, cut this
section before touching Books. That is Marius's call on NEXAA-53, and Rosa
checks it on NEXAA-45.

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

### Section: Books — **new**

**Heading**

```
Books
```

**Lede**

> Melbourne, winter of 2005. First week I ever ran a team, and on the Friday I
> genuinely could not tell you what I had done. I wrote the book I needed that
> week.

**Book 1**

> **From Code to Team — An Honest Playbook for New Engineering Leaders**
> The first ninety days of leading people, written for engineers who were good
> at the old job and have just been handed a different one. Now in its second
> edition.
>
> `[ Read it on Amazon ]`

**Companion material**

> One-pagers, playbooks and the full thirteen-session Lunch & Learn curriculum
> are free here — the scripts I use to run the material with a room.
>
> `[ Companion material ]`

**Settled — Book 1 only.** `Site / Books` lists six books; Marius confirmed on
19 September that only *From Code to Team* is published (Amazon `B0HG67BG7Z`,
second edition). Books 2 through 6 are not listed, named, or linked on the
front page, and the section is built exactly as above. When another book
publishes, this section becomes a series — that is a future revision, not a
build condition.

**Separate defect worth fixing while we are in there:** two different pages are
both numbered "Book 3" — *Installing the Operating System* and *Your New Lead*.
Whichever is live, the numbering is wrong in public.

---

### Section: Career

**Heading**

```
Twenty years, three countries
```

**Lede**

> Networks, then code, then teams — telco, retail, banking, insurance,
> hyperscale cloud, health, and defense technology.

Structure and entries as already built, with **five** corrections:

1. **Echodyne is the current role and must lead the section, dated.**
   `Director of Software Engineering — Echodyne, Seattle · 09/2026 – present`.
   The build currently has it undated, below Oracle Health, and with the wrong
   title: **"Director of Software Development"** should be **"Director of
   Software Engineering"** (confirmed in his own bio questionnaire and in three
   meeting records). As built it reads as a finished job.
2. **Oracle Health should carry its dates** (10/2024 – 06/2026) and sit below
   Echodyne.
3. **Collapse the duplicate NAB entry.** One line:
   `Service Delivery Manager, then Integration Delivery Manager — NAB`.
4. **Decipha (Melbourne, 2014–2016), Software Engineering Manager** is on the
   résumé and missing from the timeline. It is the $25M line-of-business role
   and the first time he scaled a team from 5. It should be in the Australia
   section.
5. **No line for 2026 between Oracle Health and Echodyne — settled.** Marius
   chose not to add one (19 September). The timeline is dated, so the gap
   between `06/2026` and `09/2026` is visible and uncharacterized, and that is
   his call to make. Do not insert an entry, a note, or a consulting line to
   cover it.

---

### Section: Contact

**Heading**

```
Get in touch
```

**Lede**

> Email is the surest route — I answer within a day. If a conversation is
> easier, the calendar is open.

**Cards**

```
Email              marius@nel.id.au
LinkedIn           in/marius--nel
Book 30 minutes    calendar.notion.so/meet/mariusnel/meet
```

Email first, calendar last — the reverse of the 3 September draft, for the
reason in §1. This is where the calendar link lives now; it is not in the
hero. Settled on NEXAA-53.

---

### Footer

Keep the sign-off quote, set as type rather than trapped in the cover JPEG:

> Success extends beyond the software you deliver. It encompasses the value
> you provide, the transformations you initiate, and the lasting impact you
> generate.
>
> — Marius

---

## 4. Numbers that disagree with each other — four of five resolved

**Checked 18 September 2026** against the full résumé corpus in Notion —
roughly twenty tailored résumés, cover letters and dictated notes spanning
March to August 2026. Four of the five conflicts resolve on source weight
alone.

| Claim | Live site | Résumé corpus | Verdict | Needs Marius? |
|---|---|---|---|---|
| Hardware assets | 210,000 | **21,000+**, unanimous across 14+ documents, Mar–Aug 2026 | **21,000+** | No |
| Site provisioning | *(not on site)* | **1.5 days**, unanimous Apr–Jul 2026; only a Skills tile says 3 | **4 weeks → 1.5 days** | No |
| Provisioning | 127 → 5 days | **127 → 5**, unanimous; only a Skills tile says 125 → 3 | **127 → 5 days** | No |
| Cloud cost | 37% | **$11M → $7M**, unanimous; "43%" appears attached to that same pair | **$11M → $7M** | No |
| Go-to-market | 72 weeks → 10 days | **3 days** *and* **10 days**, both current | **10 days** — chosen by Marius, 19 Sep | No (answered) |

**All five now resolve.** Four on source weight, one by Marius. In every
source-resolved row the outlier is the site's own content — the published Notion page
or a Skills tile — and the résumés agree with each other. The site is the stale
copy, not the source of truth. It was stale about the numbers, and it is stale
about his job and his book.

**On the 43%.** Not a competing measurement, just bad arithmetic: $11M → $7M is
a 36% reduction, and 43% would need $6.27M. The site's 37% is that number
rounded. Quoting the dollars, as §3 does, sidesteps a percentage that is wrong
in one of the two places it appears.

**The one Marius had to answer: 3 days or 10 days — answered, 10 days.** Both
figures were live and neither was a typo. `10 days` is the long-standing résumé line, in the April master and still
in the July requisition-tailored versions. `3 days` is in Marius's own dictated
June 2026 account — *"costs were reduced down to 7 million with a 3 days go to
market"* — and in the newer highlight bullets. The likely explanation is that
these are **two different metrics**: that same June note says *"reduced release
cycles to 3 days"* one paragraph after using 3 days for go-to-market, which is
exactly what conflating a release cycle with an idea-to-production cycle looks
like. Marius chose 10 days, which is consistent with that reading. §3 uses 10
days; the 3-day release cadence is not on the page.

### Spelling — resolved, US

This was question 4 of the old set and it is now answered on evidence rather
than preference. The site should match the book, because the site now points at
the book and a reader moves between them in one click. Marius's own book prose
is **US-side**: `centerline`, `meters`, `theater`, `behaviors`. It carries some
Commonwealth vocabulary — `aeroplane`, `fortnight` — but those are word choices,
not spellings, and they are part of his voice rather than a convention to
normalize. So: **US spelling**, which is what §3 is written in. The current
build is Australian (`defence`, `organisation`) and needs a pass.

---

## 5. Applied against the current build

Line numbers are against `index.html` at commit `876e5ff` (`main`, 19
September, the build Tess has on staging). They will drift as the file is
edited, so match on the quoted text rather than the number.

| Line | Today | Change |
|---|---|---|
| 6 | `<title>… Software Engineering Leader` | append `, Seattle` |
| 7 | meta description, **208 chars**, truncates | replace with §3 **Version B** (settled) |
| 10 | `og:type` `profile` | **correct — no change** |
| 13 | `og:title` | **correct — no change** |
| 14 | `og:description` | replace with §3 |
| 17 | `og:image` absolute URL | **correct — no change** |
| 20 | `og:image:alt` ends `…Oracle Health, NAB.` | replace with the §3 alt text (`…Oracle Health, MYOB.`) |
| 39 | `"jobTitle": "Software Engineering Leader"` | → `"Director of Software Engineering"` |
| 45–50 | `alumniOf` only; no Echodyne | **no change** — do not add `worksFor` (Version B settled) |
| 91 | eyebrow `Software Engineering Leadership` | → `Director of Software Engineering · Seattle` |
| 93–97 | hero lede, `Amazon Alexa, AWS S3 and EC2, Oracle Health and Echodyne` — lists his current employer as past | replace with §3 lede |
| 99–102 | `"I possess a talent for…"` pull quote | replace with the PR-review line in §3 |
| — | *(nothing)* | ~~availability line~~ — **withdrawn, do not build** |
| 105–107 | `Book time with me`, primary button → calendar | → `Read From Code to Team`, linking to Amazon `B0HG67BG7Z` — the one button in the hero (settled, NEXAA-53) |
| 109–116 | two ghost buttons, equal weight | email and LinkedIn become text links beside the button; the calendar link **leaves the hero** for Contact (settled, NEXAA-53) |
| 139–140 | eyebrow `Career Highlights` + `Outcomes, measured` | → `Outcomes` + §3 lede; **four cards, drop `Market &amp; team growth` (Alexa, line 165)** (settled, NEXAA-53) |
| 144 | `72 weeks → 10 days` | **correct — no change** (settled by Marius) |
| 177 | `defence technology` | → `defense` (see §4) |
| — | *(nothing)* | **insert the Books section** from §3, after How I work |
| 211–213 | three consecutive NAB entries: `Service Delivery Manager` / `Integration Delivery Manager` / `Service Delivery Manager` | collapse to one line: `Service Delivery Manager, then Integration Delivery Manager — NAB` |
| 202–217 | Australia era | add Decipha, `Software Engineering Manager · 2014–2016` |
| 241 | `Enterprise &amp; Defence Technology` | → `Defense` |
| 243 | `Oracle Health`, undated | add `10/2024 – 06/2026`, move below Echodyne; **no entry between it and Echodyne** (settled) |
| 244 | `Director of Software Engineering` — Echodyne, undated, listed last | dated `09/2026 – present`, **moved to the top of the section** (title already corrected by Tess in `876e5ff`) |
| 256–257 | eyebrow `Skills` + `How I lead` | → `How I work` — **or cut the section entirely** if the 1280×800 fold check fails (settled, NEXAA-53; Rosa checks) |
| 260–277 | 3 essays, ~150 words each | replace with §3's three ~50-word items — headings change too (`Communication / Growth / Customer Focus` → `Hands-on / Turnarounds / Growing people`), so this is a substitution, not a trim |
| 269 | `210,000` hardware assets | → `21,000+` — evidence-backed, see §4 |
| 282–338 | whole `#tech` section, 7 blocks | **delete**, replaced by the one Technology line at the end of How I work |
| 343–344 | eyebrow `✉️ Contact` + `Let's talk` | → `Get in touch` + §3 lede |
| 356 | `Book a time that suits you` | keep, but reorder below email and LinkedIn |
| 373 | footer quote | **keep as-is** |
| — | throughout | normalize Australian → US spelling |

Everything in this table is now a decision, not an option. The only conditional
left is the fold check on How I work, and that is a layout measurement rather
than a content question.

---

## 6. Handover

- **Product Designer (Rosa, NEXAA-45):** the structure is hero with one
  primary button (book) and two text links (email, LinkedIn) → Outcomes
  (**4 cards**) → How I work (3 items + a technology line) → **Books (new)** →
  Career timeline → Contact (email, LinkedIn, calendar — in that order). One
  build condition to check: at 1280×800 cold load, the positioning line and the
  book button are both above the fold. If not, cut How I work, not Books.
- **Build / SEO (Tess, NEXAA-55):** §3 is final text and §5 is the diff
  against `876e5ff`. Nothing in either is conditional on an answer from Marius
  any more. What gates the build is the user's approval of this revision — the
  confirmation card on NEXAA-47 — and that is the only gate before staging.
  The DNS cutover to `www.marius-nel.com` stays a separate decision on
  NEXAA-55 and is not affected by this document.
- **Settled by Marius, 19 September (card `d65d7886`):** meta description B;
  10 days; Book 1 only; no 2026 line. Recorded in §0 and applied throughout.
- **The availability line is withdrawn, not pending.** It needs no answer. It
  must not ship.
- **Not published.** `index.html` is deliberately untouched by this document —
  this repo publishes to staging on push.

---

## 7. Status, 19 September 2026 — approved

**Approved by Marius on 19 September 2026 (NEXAA-47 confirmation card
`836ba4d0`, accepted 17:02Z) for the staging build.** Tess's draft PR #2
(`nexaa-55/copy-revision-3` @ `64e9dd9`) was reviewed against §3 before the
approval and matches it word for word; on acceptance it merges to `main` and
deploys to the GitHub Pages staging URL only. The live domain is a separate
decision on NEXAA-55.

**The content deliverable is complete.** §1–§3 are the three things the issue
asked for: the audience sentence (confirmed by Marius), the section collapse
(four Outcomes cards, Books added, fold condition set), and final copy
including title and meta description (Version B, chosen by Marius). §0 records
why the 3 September version had to be rewritten and every decision made since.
No question in this document is open.

**Withdrawn.** The line the 3 September draft held for approval — *"Open to
Director and Senior Engineering Manager roles"* — is withdrawn and stays out.
Marius had been at Echodyne eleven days when it was caught. Tess confirmed on
NEXAA-55 that it is not on the staging build.

**Next.** Tess merges PR #2 on NEXAA-55; Rosa runs the 1280×800 fold check on
NEXAA-45 once it is on staging. Cutover is a separate decision. NEXAA-47 is
closed.
