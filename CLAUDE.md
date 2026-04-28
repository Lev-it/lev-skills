# lev-it/lev-skills

This is the LeverageIT shared agent skills repository. It contains curated `SKILL.md` files for Claude Code and other AI coding agents.

## Repo structure

```
.claude/skills/<skill-name>/SKILL.md   ← skill instructions + frontmatter
README.md                              ← team install guide
CLAUDE.md                              ← this file
skills-lock.json                       ← lockfile tracking skill sources
```

## Installing skills from this repo

```bash
# Global install (recommended — works across all projects)
npx skills add lev-it/lev-skills -a claude-code -g -y

# Project-level install (commit .claude/skills/ to share with the team)
npx skills add lev-it/lev-skills -a claude-code -y
```

## Adding a new skill

1. Create the directory and file:
   ```bash
   mkdir -p .claude/skills/<skill-name>
   # create SKILL.md with name + description frontmatter and instructions
   ```

2. Required frontmatter:
   ```markdown
   ---
   name: skill-name
   description: When and why Claude should use this skill (be specific — this is what triggers auto-activation).
   ---
   ```

3. Commit and push to a branch, open a PR into `main`.

## Pulling in an external skill

```bash
npx skills add owner/repo --skill skill-name -a claude-code -y --copy
git add .claude/skills/<skill-name>/
git commit -m "feat: add <skill-name> from owner/repo"
```

## Updating all skills to latest

```bash
npx skills update -g -y
```

## Current skills

22 skills across: UI/Frontend, Productivity, GitHub, Deployment, Documents/Data, and Infrastructure.
Run `npx skills add lev-it/lev-skills --list` to see the full list with descriptions.
