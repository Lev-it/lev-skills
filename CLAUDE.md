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
| `vercel-optimize` | Vercel cost and performance optimization — bill reduction, slow routes, caching, Core Web Vitals, Fluid compute. |
| `writing-guidelines` | Reviews docs and prose for voice, tone, and writing style compliance. |

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

### Product Management

| Skill | What it does |
|---|---|
| `analyze-feature-requests` | Analyzes and prioritizes feature requests by theme, strategic alignment, impact, and risk. |
| `interview-script` | Generates structured user interview scripts for discovery. |
| `summarize-interview` | Summarizes user interview recordings into insights and quotes. |
| `summarize-meeting` | Summarizes meeting notes into decisions, actions, and key points. |
| `sentiment-analysis` | Analyzes user feedback for sentiment patterns and themes. |
| `user-personas` | Creates detailed user personas from research data. |
| `user-segmentation` | Segments users by behavior, needs, and characteristics. |
| `customer-journey-map` | Maps end-to-end customer journeys with touchpoints, emotions, and pain points. |
| `market-segments` | Identifies and profiles distinct market segments. |
| `market-sizing` | Estimates TAM/SAM/SOM for a market. |
| `competitor-analysis` | Analyzes competitors with strengths, weaknesses, and differentiation opportunities. |
| `competitive-battlecard` | Creates sales-ready competitive battlecards for a specific competitor. |
| `product-vision` | Crafts a clear, inspiring product vision statement. |
| `product-strategy` | Defines product strategy with goals, bets, and success metrics. |
| `opportunity-solution-tree` | Builds an Opportunity Solution Tree linking outcomes to opportunities and solutions. |
| `outcome-roadmap` | Creates an outcome-based roadmap aligned to business goals. |
| `brainstorm-okrs` | Brainstorms team-level OKRs aligned with company objectives. |
| `north-star-metric` | Identifies the North Star metric and supporting metrics tree. |
| `lean-canvas` | Fills out a Lean Canvas for a product or startup idea. |
| `startup-canvas` | Creates a full Startup Canvas covering problem, solution, and traction. |
| `business-model` | Generates a Business Model Canvas with all 9 building blocks. |
| `ansoff-matrix` | Maps growth strategies across market penetration, development, and diversification. |
| `swot-analysis` | Produces a SWOT analysis for a product or company. |
| `pestle-analysis` | Runs a PESTLE analysis for macro-environment factors. |
| `porters-five-forces` | Analyzes industry competitiveness using Porter's Five Forces. |
| `value-proposition` | Defines the value proposition canvas for a product or feature. |
| `brainstorm-ideas-new` | Brainstorms features for a new product from PM, Designer, and Engineer perspectives. |
| `brainstorm-ideas-existing` | Brainstorms features for an existing product from a product trio perspective. |
| `brainstorm-experiments-new` | Designs lean startup experiments (pretotypes) for a new product idea. |
| `brainstorm-experiments-existing` | Designs experiments to validate assumptions for an existing product. |
| `identify-assumptions-new` | Identifies risky assumptions for a new product across 8 risk categories. |
| `identify-assumptions-existing` | Identifies risky assumptions for a feature in an existing product. |
| `prioritize-assumptions` | Prioritizes assumptions by risk and testability for validation sequencing. |
| `pre-mortem` | Runs a pre-mortem to surface risks before a launch or decision. |
| `strategy-red-team` | Red-teams a strategy or plan to find weaknesses and blind spots. |
| `create-prd` | Creates a full Product Requirements Document using an 8-section template. |
| `job-stories` | Writes job stories in JTBD format with acceptance criteria. |
| `user-stories` | Writes user stories with acceptance criteria and edge cases. |
| `prioritize-features` | Prioritizes a feature list using impact, effort, and strategic alignment. |
| `prioritization-frameworks` | Applies RICE, MoSCoW, Kano, or other prioritization frameworks. |
| `sprint-plan` | Creates a sprint plan with goals, stories, and capacity allocation. |
| `stakeholder-map` | Maps stakeholders by influence, interest, and communication needs. |
| `release-notes` | Writes polished release notes from a feature list or changelog. |
| `shipping-artifacts` | Generates all shipping artifacts — release notes, comms, tickets — from a brief. |
| `retro` | Facilitates a sprint retrospective with structured format. |
| `test-scenarios` | Generates comprehensive test scenarios for a feature or user story. |
| `intended-vs-implemented` | Finds gaps between what a system is supposed to do and what the code actually does. |
| `dummy-dataset` | Generates realistic dummy datasets for testing and demos. |
| `gtm-strategy` | Creates a full go-to-market strategy with channels, messaging, and launch timeline. |
| `gtm-motions` | Identifies the best GTM motions (inbound, outbound, PLG, ABM, partners, etc.). |
| `beachhead-segment` | Identifies the best first beachhead market segment for launch. |
| `ideal-customer-profile` | Defines the ICP from research with demographics, behaviors, and JTBD. |
| `growth-loops` | Identifies viral, usage, collaboration, and referral growth loops. |
| `marketing-ideas` | Brainstorms marketing campaign ideas for a product or feature. |
| `positioning-ideas` | Generates positioning statements and messaging angles. |
| `value-prop-statements` | Writes value proposition statements for different audiences. |
| `product-name` | Generates and evaluates product name ideas. |
| `monetization-strategy` | Designs monetization models and pricing approaches. |
| `pricing-strategy` | Analyzes pricing strategy options with trade-offs. |
| `metrics-dashboard` | Designs a metrics dashboard with KPIs, leading indicators, and guardrails. |
| `ab-test-analysis` | Analyzes A/B test results with statistical significance and ship/extend/stop recommendations. |
| `cohort-analysis` | Performs cohort analysis on user data — retention curves, feature adoption, churn. |
| `sql-queries` | Writes SQL queries for product analytics — retention, funnels, cohorts, segmentation. |
| `grammar-check` | Identifies grammar, logic, and flow errors and suggests targeted fixes. |
| `review-resume` | Reviews a resume for clarity, impact, and positioning. |
| `draft-nda` | Drafts a Non-Disclosure Agreement between two parties. |
| `privacy-policy` | Generates a privacy policy for a product or service. |
| `legal-templates` | Attorney-drafted legal templates (NDA, privacy policy, ToS, DPA, MSA, BAA, offer letter, advisor agreement). Auto-triggers on any legal document request. |
| `wwas` | Runs a "What Went / What Almost / So What" retrospective format. |

### Engineering Workflow

| Skill | What it does |
|---|---|
| `codebase-design` | Shared vocabulary for designing deep modules and finding deepening opportunities. |
| `domain-modeling` | Builds and sharpens a project's domain model and ubiquitous language. |
| `design-an-interface` | Generates multiple radically different interface designs via parallel sub-agents. |
| `ubiquitous-language` | Establishes and maintains shared domain terminology across the codebase. |
| `decision-mapping` | Maps out a decision space before committing to an approach. |
| `improve-codebase-architecture` | Finds deepening opportunities informed by domain language and ADRs. |
| `implement` | Implements a feature or fix using the project's conventions and domain model. |
| `prototype` | Builds a quick throwaway prototype to validate an idea. |
| `diagnosing-bugs` | Diagnosis loop for hard bugs and performance regressions. |
| `resolving-merge-conflicts` | Resolves in-progress git merge/rebase conflicts. |
| `request-refactor-plan` | Creates a detailed refactor plan with tiny commits, filed as a GitHub issue. |
| `migrate-to-shoehorn` | Migrates test files from `as` type assertions to `@total-typescript/shoehorn`. |
| `to-prd` | Converts a brief or conversation into a structured PRD. |
| `to-issues` | Breaks a plan or PRD into granular GitHub issues. |
| `review` | Reviews a pull request for correctness, style, and architecture. |
| `triage` | Triages a bug report or issue into priority, severity, and next steps. |
| `qa` | Interactive QA session — conversationally report bugs and file GitHub issues. |
| `handoff` | Writes a handoff document summarizing context for the next person. |
| `grilling` | Stress-tests a plan or design by interviewing the user relentlessly. |
| `grill-me` | Grills the user on a topic to surface gaps and assumptions. |
| `grill-with-docs` | Grills a plan or decision against official documentation. |
| `teach` | Teaches a concept through Socratic questioning and examples. |
| `ask-matt` | Answers TypeScript and engineering questions in Matt Pocock's style. |
| `writing-beats` | Shapes an article as a journey of beats, assembled conversationally. |
| `writing-fragments` | Mines raw ideas and fragments before imposing structure on an article. |
| `writing-shape` | Turns notes or a rough draft into a publishable article, paragraph by paragraph. |
| `edit-article` | Edits an article for clarity, structure, and voice. |
| `scaffold-exercises` | Creates exercise directory structures with problems, solutions, and explainers. |
| `git-guardrails-claude-code` | Sets up Claude Code hooks to block dangerous git commands before execution. |
| `setup-pre-commit` | Sets up Husky pre-commit hooks with lint-staged, type-checking, and tests. |
| `obsidian-vault` | Searches, creates, and manages notes in an Obsidian vault with wikilinks. |

### Research & Web Reach

| Skill | What it does |
|---|---|
| `agent-reach` | Web and platform research across 13 channels — Twitter/X, Reddit, LinkedIn, YouTube, GitHub, and more. |
| `last30days` | Research what people actually say about any topic in the last 30 days. Pulls posts and engagement from Reddit, X, YouTube, TikTok, Hacker News, Polymarket, GitHub, and the web. |

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

<!-- 161 skills across 12 categories — run `npx skills add lev-it/lev-skills --list` for the full list -->
