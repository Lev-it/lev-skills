# lev-it/lev-skills

This is the LeverageIT shared agent skills repository. It contains curated `SKILL.md` files for Claude Code and other AI coding agents.

Skills are Markdown files with YAML frontmatter. Claude reads the `description` field to decide when to apply a skill automatically, then follows the instructions inside during that task.

## Repo structure

```
.claude/skills/<skill-name>/SKILL.md   ← skill instructions + frontmatter
README.md                              ← team install guide
CLAUDE.md                              ← this file
skills-lock.json                       ← lockfile tracking skill sources
```

## Installing skills from this repo

```bash
# Global install — works across all projects on your machine
npx skills add lev-it/lev-skills -a claude-code -g -y

# Project-level install — commit .claude/skills/ so the whole team gets them on pull
npx skills add lev-it/lev-skills -a claude-code -y
git add .claude/skills/ && git commit -m "chore: add lev-it agent skills"

# See what's available before installing
npx skills add lev-it/lev-skills --list

# Install specific skills only
npx skills add lev-it/lev-skills --skill systematic-debugging --skill tdd -a claude-code -g -y
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

## Adding a new skill to this repo

1. Create the skill directory and `SKILL.md`:
   ```bash
   mkdir -p .claude/skills/my-skill
   npx skills init my-skill
   mv my-skill/SKILL.md .claude/skills/my-skill/SKILL.md
   rmdir my-skill
   ```

2. Fill in the frontmatter and instructions:
   ```markdown
   ---
   name: my-skill
   description: What this skill does and when Claude should use it automatically.
   ---

   # My Skill

   Instructions for Claude to follow when this skill is active.
   ```
   > The `description` field controls auto-activation — be specific about triggers.

3. Test locally, then open a PR:
   ```bash
   git checkout -b add-my-skill
   git add .claude/skills/my-skill/
   git commit -m "feat: add my-skill"
   git push -u origin add-my-skill
   ```

## Pulling in an external skill

```bash
npx skills add owner/repo --skill skill-name -a claude-code -y --copy
git add .claude/skills/<skill-name>/
git commit -m "feat: add <skill-name> from owner/repo"
```

## Updating and removing skills

```bash
npx skills update -g -y                    # update all global skills
npx skills update transitions-dev -g       # update one skill
npx skills remove <skill-name> -g          # remove a skill
```
