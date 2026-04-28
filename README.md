# LeverageIT Agent Skills

A curated collection of [agent skills](https://agentskills.io) for the LeverageIT dev team. Works with Claude Code and 50+ other AI coding agents.

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
