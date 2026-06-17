# CLAUDE.md

Behavioral guidelines and repo context for the LeverageIT agent skills repository.

---

## 1. Think Before Coding

**Don't assume. Don't hide confusion. Surface tradeoffs.**

Before implementing:

* State your assumptions explicitly. If uncertain, ask.
* If multiple interpretations exist, present them — don't pick silently.
* If a simpler approach exists, say so. Push back when warranted.
* If something is unclear, stop. Name what's confusing. Ask.

## 2. Simplicity First

**Minimum code that solves the problem. Nothing speculative.**

* No features beyond what was asked.
* No abstractions for single-use code.
* No "flexibility" or "configurability" that wasn't requested.
* No error handling for impossible scenarios.
* If you write 200 lines and it could be 50, rewrite it.

Ask yourself: "Would a senior engineer say this is overcomplicated?" If yes, simplify.

## 3. Surgical Changes

**Touch only what you must. Clean up only your own mess.**

When editing existing code:

* Don't "improve" adjacent code, comments, or formatting.
* Don't refactor things that aren't broken.
* Match existing style, even if you'd do it differently.
* If you notice unrelated dead code, mention it — don't delete it.

When your changes create orphans:

* Remove imports/variables/functions that YOUR changes made unused.
* Don't remove pre-existing dead code unless asked.

The test: Every changed line should trace directly to the user's request.

## 4. Goal-Driven Execution

**Define success criteria. Loop until verified.**

Transform tasks into verifiable goals:

* "Add a skill" → "Skill installs cleanly via `npx skills add`, description triggers correctly"
* "Update a skill" → "Confirm the SKILL.md diff is minimal and frontmatter is valid"

For multi-step tasks, state a brief plan:

```
1. [Step] → verify: [check]
2. [Step] → verify: [check]
3. [Step] → verify: [check]
```

---

## Repo Overview

This is the LeverageIT shared agent skills repo. Skills are `SKILL.md` files Claude reads to extend its capabilities. The `description` frontmatter field controls when a skill auto-activates.

```
.claude/skills/<skill-name>/SKILL.md   ← skill instructions + frontmatter
README.md                              ← team install guide
CLAUDE.md                              ← this file
skills-lock.json                       ← lockfile tracking skill sources
```

## Available Skills

### UI & Frontend

| Skill | What it does |
|---|---|
| `transitions-dev` | Production-ready CSS transitions (modals, dropdowns, badges, page slides). Auto-triggers on any UI build task. |
| `frontend-skill` | Enforces strong visual hierarchy, image-led layouts, and tasteful motion for landing pages and app UIs. |
| `web-design-guidelines` | Reviews UI code for accessibility, UX best practices, and design system compliance. |
| `vercel-composition-patterns` | React composition patterns — compound components, context, render props, React 19 APIs. |
| `vercel-react-best-practices` | Next.js & React performance: memoization, bundle splitting, server components, hydration. |
| `vercel-react-native-skills` | React Native / Expo best practices for lists, animations, native modules, and performance. |
| `vercel-react-view-transitions` | Smooth page/route transitions using React's View Transition API and `<ViewTransition>`. |

### Design Taste

| Skill | What it does |
|---|---|
| `design-taste-frontend` | Senior UI/UX engineer rules — metric-based layout, strict component hierarchy, anti-generic patterns. |
| `high-end-visual-design` | Agency-level design system: exact fonts, spacing, shadows, card structures, and animations. |
| `minimalist-ui` | Clean editorial interfaces — warm monochrome, typographic contrast, flat bento grids, muted pastels. |
| `industrial-brutalist-ui` | Raw mechanical interfaces — Swiss grid, military terminal aesthetics, extreme type scale, declassified-blueprint feel. |
| `gpt-taste` | Elite UX/UI with advanced GSAP motion — AIDA structure, wide editorial type, gapless bento grids, ScrollTrigger. |
| `brandkit` | Premium brand-kit image generation — logo systems, identity decks, visual-world presentations for high-end brands. |
| `stitch-design-taste` | Generates `DESIGN.md` design-system files that enforce premium, anti-generic UI for Google Stitch. |
| `image-to-code` | Generates design images first, deeply analyses them, then implements the website to match as closely as possible. |
| `imagegen-frontend-web` | Premium artistic website design references — art-directed, implementation-friendly image generation. |
| `imagegen-frontend-mobile` | Premium iOS/Android screen concepts and flows — app-native image generation for mobile design. |
| `redesign-existing-projects` | Audits current design, identifies generic AI patterns, and upgrades existing sites to premium quality. |
| `full-output-enforcement` | Overrides LLM truncation — enforces complete code generation, bans placeholder patterns. |
| `hallmark` | Anti-AI-slop design — builds, audits, and redesigns pages to avoid generic AI patterns. Triggers on new pages, redesigns, audits, and URL/screenshot design extraction. |

### Engineering Standards

| Skill | What it does |
|---|---|
| `typed-service-contracts` | Architecture standard for type-safe TypeScript services using the "Spec and Handler" pattern — for CLIs, libraries, and complex business logic. |
| `tdd-red-green-refactor` | Enforces disciplined Red-Green-Refactor TDD in TypeScript/Node.js — for new features, bug fixes, and logic migrations. |
| `agent-dx-cli-scale` | Scoring scale for evaluating how well a CLI is designed for AI agents, based on "Rewrite Your CLI for AI Agents" principles. |
| `ink` | Ink terminal renderer for `@json-render/ink` — turns JSON specs into interactive terminal UIs. |

### Productivity & Workflow

| Skill | What it does |
|---|---|
| `brainstorming` | Explores requirements and design before implementation — use before any creative or feature work. |
| `planning-with-files` | File-based task planning (task_plan.md, findings.md, progress.md) for complex multi-step projects. |
| `systematic-debugging` | Structured debugging protocol — hypothesis, isolation, root cause — before jumping to fixes. |
| `tdd` | Test-driven development workflow — write the test first, then the implementation. |
| `find-docs` | Fetches up-to-date docs and API references for any library or framework before writing code. |

### GitHub

| Skill | What it does |
|---|---|
| `gh-address-comments` | Reads and addresses PR review comments on the current branch using `gh` CLI. |
| `gh-fix-ci` | Inspects failing GitHub Actions checks, summarises the failure, and proposes a fix. |

### Deployment

| Skill | What it does |
|---|---|
| `deploy-to-vercel` | Deploys apps to Vercel — "deploy my app", "push this live", "create a preview". |
| `vercel-cli-with-tokens` | Vercel CLI deployments using token-based auth (CI/CD and non-interactive environments). |

### Documents & Data

| Skill | What it does |
|---|---|
| `minimax-docx` | Creates, edits, and formats Word documents (.docx) via OpenXML — reports, proposals, contracts. |
| `minimax-pdf` | Generates and reformats print-ready PDFs with a design-token system for visual consistency. |
| `minimax-xlsx` | Creates, reads, edits, and validates Excel files — financial models, pivot tables, formulas. |
| `pptx-generator` | Generates and edits PowerPoint presentations with PptxGenJS — decks, slide layouts, exports. |
| `drawio-skill` | Generates draw.io diagrams (flowcharts, architecture, ERDs) from natural language, exports to PNG/SVG/PDF. |

### Infrastructure

| Skill | What it does |
|---|---|
| `session-start-hook` | Creates Claude Code `SessionStart` hooks that install dependencies before a session begins. |

### Video & Motion

| Skill | What it does |
|---|---|
| `hyperframes` | Entry point for all video work — routes any "make me a video" request to the right workflow. Start here. |
| `hyperframes-core` | HyperFrames HTML composition contract — structure, clips, tracks, variables, media playback, render rules. |
| `hyperframes-animation` | All animation knowledge — atomic motion rules, scene blueprints, transitions, GSAP/Lottie/Three.js/CSS adapters. |
| `hyperframes-creative` | Creative direction — palettes, typography, narration, beat planning, audio-reactive visuals, brand decisions. |
| `hyperframes-media` | Asset preprocessing — TTS (HeyGen/ElevenLabs), BGM, Whisper transcription, background removal, captions. |
| `hyperframes-cli` | HyperFrames CLI dev loop — init, render, publish, lambda, preview, lint, and troubleshooting. |
| `hyperframes-registry` | Install and wire registry blocks and components into compositions. |
| `product-launch-video` | SaaS promo, feature reveal, or launch video from a product URL or brief. |
| `faceless-explainer` | Text/article/notes → narrated explainer video with typography and abstract graphics. |
| `website-to-video` | Captures a website and turns it into a narrated walkthrough video. |
| `pr-to-video` | GitHub PR → code-diff explainer video with narration and visuals. |
| `motion-graphics` | Short design-led motion graphics — logo stings, kinetic type, stat pops, lower-thirds (under 30s). |
| `embedded-captions` | Adds cinematic captions to talking-head video — 32 visual identities, VFX-grade styling. |
| `graphic-overlays` | Layers timed graphic overlay cards (titles, lower-thirds, callouts) onto an existing video. |
| `general-video` | Fallback for longer or freeform video compositions that don't fit a specialised workflow. |
| `remotion-to-hyperframes` | Ports existing Remotion compositions to HyperFrames. |

## Common Tasks

**Install all skills globally:**
```bash
npx skills add lev-it/lev-skills -a claude-code -g -y
```

**Add a new skill:**
```bash
mkdir -p .claude/skills/my-skill
# create SKILL.md with name + description frontmatter and instructions
git checkout -b add-my-skill
git add .claude/skills/my-skill/
git commit -m "feat: add my-skill"
git push -u origin add-my-skill
```

**Pull in an external skill:**
```bash
npx skills add owner/repo --skill skill-name -a claude-code -y --copy
git add .claude/skills/<skill-name>/
git commit -m "feat: add <skill-name> from owner/repo"
```

**Update all skills:**
```bash
npx skills update -g -y
```

---

**These guidelines are working if:** diffs are minimal and purposeful, skills install and trigger cleanly, and questions come before implementation rather than after mistakes.
