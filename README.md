# LeverageIT Agent Skills

A curated collection of **57 agent skills** across 9 categories for the LeverageIT dev team. Works with Claude Code and 50+ other AI coding agents.

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
