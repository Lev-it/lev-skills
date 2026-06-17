# LeverageIT Agent Skills

A curated collection of **159 agent skills** across 12 categories for the LeverageIT dev team. Works with Claude Code and 50+ other AI coding agents.

## Install All Skills

**One-liner — installs globally on your machine:**
```bash
npx skills add lev-it/lev-skills -a claude-code -g -y
```

**Or commit to a project repo** so every dev gets them automatically when they pull:
```bash
# Run once inside your project repo
npx skills add lev-it/lev-skills -a claude-code -y
# Then commit .claude/skills/
git add .claude/skills/ && git commit -m "chore: add lev-it agent skills"
```

## Install Specific Skills

```bash
# See what's available first
npx skills add lev-it/lev-skills --list

# Install one skill
npx skills add lev-it/lev-skills --skill transitions-dev -a claude-code -g -y

# Install several
npx skills add lev-it/lev-skills --skill systematic-debugging --skill tdd --skill gh-fix-ci -a claude-code -g -y
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

### Design Taste (from [Leonxlnx/taste-skill](https://github.com/Leonxlnx/taste-skill) & [nutlope/hallmark](https://github.com/nutlope/hallmark))

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

### Engineering Standards (from [google-labs-code/design.md](https://github.com/google-labs-code/design.md))

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
| `drawio-skill` | Generates draw.io diagrams (flowcharts, architecture, ERDs) from natural language and exports to PNG/SVG/PDF. |

### Infrastructure

| Skill | What it does |
|---|---|
| `session-start-hook` | Creates Claude Code `SessionStart` hooks that install dependencies before a session begins. |

### Video & Motion (from [heygen-com/hyperframes](https://github.com/heygen-com/hyperframes))

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

### Product Management (from [phuryn/pm-skills](https://github.com/phuryn/pm-skills))

**Discovery & Research**

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

**Strategy & Planning**

| Skill | What it does |
|---|---|
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

**Ideation & Validation**

| Skill | What it does |
|---|---|
| `brainstorm-ideas-new` | Brainstorms features for a new product from PM, Designer, and Engineer perspectives. |
| `brainstorm-ideas-existing` | Brainstorms features for an existing product from a product trio perspective. |
| `brainstorm-experiments-new` | Designs lean startup experiments (pretotypes) for a new product idea. |
| `brainstorm-experiments-existing` | Designs experiments (A/B tests, spikes, prototypes) to validate assumptions for an existing product. |
| `identify-assumptions-new` | Identifies risky assumptions for a new product across 8 risk categories. |
| `identify-assumptions-existing` | Identifies risky assumptions for a feature in an existing product. |
| `prioritize-assumptions` | Prioritizes assumptions by risk and testability for validation sequencing. |
| `pre-mortem` | Runs a pre-mortem to surface risks before a launch or decision. |
| `strategy-red-team` | Red-teams a strategy or plan to find weaknesses and blind spots. |

**Execution & Delivery**

| Skill | What it does |
|---|---|
| `create-prd` | Creates a full Product Requirements Document using an 8-section template. |
| `job-stories` | Writes job stories in JTBD format with acceptance criteria. |
| `user-stories` | Writes user stories with acceptance criteria and edge cases. |
| `prioritize-features` | Prioritizes a feature list using impact, effort, and strategic alignment. |
| `prioritization-frameworks` | Applies RICE, MoSCoW, Kano, or other prioritization frameworks. |
| `sprint-plan` | Creates a sprint plan with goals, stories, and capacity allocation. |
| `stakeholder-map` | Maps stakeholders by influence, interest, and communication needs. |
| `release-notes` | Writes polished release notes from a feature list or changelog. |
| `shipping-artifacts` | Generates all shipping artifacts — release notes, comms, tickets — from a brief. |
| `retro` | Facilitates a sprint retrospective with structured what-went-well/delta format. |
| `test-scenarios` | Generates comprehensive test scenarios for a feature or user story. |
| `intended-vs-implemented` | Finds gaps between what a system is supposed to do and what the code actually does. |
| `dummy-dataset` | Generates realistic dummy datasets for testing and demos. |

**Growth & GTM**

| Skill | What it does |
|---|---|
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

**Analytics**

| Skill | What it does |
|---|---|
| `metrics-dashboard` | Designs a metrics dashboard with KPIs, leading indicators, and guardrails. |
| `ab-test-analysis` | Analyzes A/B test results with statistical significance and ship/extend/stop recommendations. |
| `cohort-analysis` | Performs cohort analysis on user data — retention curves, feature adoption, churn. |
| `sql-queries` | Writes SQL queries for product analytics — retention, funnels, cohorts, segmentation. |

**Miscellaneous**

| Skill | What it does |
|---|---|
| `grammar-check` | Identifies grammar, logic, and flow errors and suggests targeted fixes. |
| `review-resume` | Reviews a resume for clarity, impact, and positioning. |
| `draft-nda` | Drafts a Non-Disclosure Agreement between two parties. |
| `privacy-policy` | Generates a privacy policy for a product or service. |
| `wwas` | Runs a "What Went / What Almost / So What" retrospective format. |

### Engineering Workflow (from [mattpocock/skills](https://github.com/mattpocock/skills))

**Design & Architecture**

| Skill | What it does |
|---|---|
| `codebase-design` | Shared vocabulary for designing deep modules and finding deepening opportunities. |
| `domain-modeling` | Builds and sharpens a project's domain model and ubiquitous language. |
| `design-an-interface` | Generates multiple radically different interface designs via parallel sub-agents. |
| `ubiquitous-language` | Establishes and maintains shared domain terminology across the codebase. |
| `decision-mapping` | Maps out a decision space before committing to an approach. |
| `improve-codebase-architecture` | Finds deepening opportunities informed by domain language and ADRs. |

**Development**

| Skill | What it does |
|---|---|
| `implement` | Implements a feature or fix using the project's conventions and domain model. |
| `prototype` | Builds a quick throwaway prototype to validate an idea. |
| `tdd` | Test-driven development — red-green-refactor workflow. |
| `diagnosing-bugs` | Diagnosis loop for hard bugs and performance regressions. |
| `resolving-merge-conflicts` | Resolves in-progress git merge/rebase conflicts. |
| `request-refactor-plan` | Creates a detailed refactor plan with tiny commits, filed as a GitHub issue. |
| `migrate-to-shoehorn` | Migrates test files from `as` type assertions to `@total-typescript/shoehorn`. |

**Planning & Review**

| Skill | What it does |
|---|---|
| `to-prd` | Converts a brief or conversation into a structured PRD. |
| `to-issues` | Breaks a plan or PRD into granular GitHub issues. |
| `review` | Reviews a pull request for correctness, style, and architecture. |
| `triage` | Triages a bug report or issue into priority, severity, and next steps. |
| `qa` | Interactive QA session — conversationally report bugs and file GitHub issues. |
| `handoff` | Writes a handoff document summarizing context for the next person. |
| `grilling` | Stress-tests a plan or design by interviewing the user relentlessly. |
| `grill-me` | Grills the user on a topic to surface gaps and assumptions. |
| `grill-with-docs` | Grills a plan or decision against official documentation. |

**Learning & Writing**

| Skill | What it does |
|---|---|
| `teach` | Teaches a concept through Socratic questioning and examples. |
| `ask-matt` | Answers TypeScript and engineering questions in Matt Pocock's style. |
| `writing-great-skills` | Guides writing high-quality agent skills. |
| `writing-beats` | Shapes an article as a journey of beats, assembled conversationally. |
| `writing-fragments` | Mines raw ideas and fragments before imposing structure on an article. |
| `writing-shape` | Turns notes or a rough draft into a publishable article, paragraph by paragraph. |
| `edit-article` | Edits an article for clarity, structure, and voice. |
| `scaffold-exercises` | Creates exercise directory structures with problems, solutions, and explainers. |

**Tooling**

| Skill | What it does |
|---|---|
| `git-guardrails-claude-code` | Sets up Claude Code hooks to block dangerous git commands before execution. |
| `setup-pre-commit` | Sets up Husky pre-commit hooks with lint-staged, type-checking, and tests. |
| `setup-matt-pocock-skills` | Onboarding skill that configures Matt Pocock's full skill suite for a project. |
| `obsidian-vault` | Searches, creates, and manages notes in an Obsidian vault with wikilinks. |

### Research & Web Reach (from [Panniantong/Agent-Reach](https://github.com/Panniantong/Agent-Reach))

| Skill | What it does |
|---|---|
| `agent-reach` | Web and platform research across 13 channels — Xiaohongshu, Twitter/X, Reddit, LinkedIn, YouTube, GitHub, B站, V2EX, RSS, and more. Use for any "research this", "look up", or "search for" request. |

## Update Skills

```bash
# Update all installed skills to latest
npx skills update -g -y

# Update a single skill
npx skills update transitions-dev -g
```

## Remove a Skill

```bash
npx skills remove <skill-name> -g
```

## Adding a New Skill to This Repo

1. **Create the skill directory and file:**
   ```bash
   cd /path/to/lev-skills
   mkdir -p .claude/skills/my-skill
   npx skills init my-skill    # generates a SKILL.md template
   mv my-skill/SKILL.md .claude/skills/my-skill/SKILL.md
   rmdir my-skill
   ```

2. **Edit `.claude/skills/my-skill/SKILL.md`** — fill in `name`, `description`, and the instructions.

   ```markdown
   ---
   name: my-skill
   description: What this skill does and when Claude should use it automatically.
   ---

   # My Skill

   Instructions for Claude to follow when this skill is active.
   ```

   > The `description` field is what triggers auto-activation — be specific about the scenarios where Claude should use it.

3. **Test it locally:**
   ```bash
   npx skills add ./  --skill my-skill -a claude-code -y
   ```

4. **Commit and open a PR:**
   ```bash
   git checkout -b add-my-skill
   git add .claude/skills/my-skill/
   git commit -m "feat: add my-skill"
   git push -u origin add-my-skill
   ```

## Adding External Skills

Found a skill on [skills.sh](https://skills.sh) or GitHub that the whole team should have? Install it here and commit:

```bash
# Install from any public GitHub repo
npx skills add owner/repo --skill skill-name -a claude-code -y --copy

# Commit it
git add .claude/skills/skill-name/
git commit -m "feat: add skill-name from owner/repo"
```

## How Skills Work

Skills are Markdown files (`SKILL.md`) with YAML frontmatter. Claude reads the `description` to decide when to apply a skill automatically, and follows the instructions inside during that task.

- **Project scope** (`.claude/skills/`) — skills committed to a repo, shared with the whole team
- **Global scope** (`~/.claude/skills/`) — skills on your machine, available in every project

For more on the spec: [agentskills.io](https://agentskills.io)
