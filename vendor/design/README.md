# Lev design skills pack (vendored, pinned)

Upstream design skills copied as files at fixed commits, with a few small Lev patches. Nothing in this folder is installed anywhere yet. It lives outside `.claude/skills/`, so `npx skills add lev-it/lev-skills` does **not** pick it up. Rolling it out to agents is a separate, approved step.

## Which skill when

| Need | Use | Tier |
|---|---|---|
| Review, critique, audit or polish an existing UI | **impeccable** (`core/impeccable`) | core |
| Build a new page or site from scratch | **hallmark** (`core/hallmark`) | core |
| Motion and animation: add, review or tune it; component feel | **Emil Kowalski skills** (`core/emil/*`, e.g. `animate`, `review-animations`, `emil-design-eng`) | core |
| Write, lint, diff or export a DESIGN.md (Google format) | **design-md** (`core/design-md`) | core (Lev-authored) |
| Searchable style, palette and font-pairing database | ui-ux-pro-max (`optional/ui-ux-pro-max`) | optional trial |
| Art direction for landing pages from a curated gallery library | taste-skill (`optional/taste-skill`, skill name `design-taste-frontend`) | optional trial |
| Isometric, "dimensional" line drawings and motion films | dimensional-drawing (`optional/dimensional-drawing/*`) | optional trial |
| Writing GSAP code (core, timeline, ScrollTrigger, React and more) | gsap skills (`optional/gsap/*`) | optional trial |

Rules of thumb:
- Existing screen: start with **impeccable**.
- Blank page: start with **hallmark**.
- Anything that moves: hand it to **Emil**.
- Design tokens for agents: write them with **design-md**.
- Don't load two "taste" skills at once. They disagree on purpose.

**Optional** skills are for trial only. Don't enable them by default. Each one gets a short trial before any decision to promote or drop it.

## Layout

```
vendor/design/
  skills.lock               pins: name, tier, upstream, sha, version, license, src, path, strip, patch
  core/                     impeccable, hallmark, emil/<15 skills>, design-md
  optional/                 ui-ux-pro-max, taste-skill, dimensional-drawing/<2>, gsap/<8 + llms.txt>
  patches/<name>.patch      Lev patches, re-applied by the sync script
  LICENSES/                 upstream LICENSE / NOTICE files, verbatim
  NOTICE                    Apache-2.0 notice and statement of Lev modifications
  THIRD_PARTY_NOTICES.md    every upstream, its license and what we changed
  DEPRECATIONS.md           older copies in .claude/skills proposed for retirement
  redflag-allowlist.txt     reviewed benign matches for the red-flag scan
scripts/sync-design-skills.sh    re-copy pinned upstream files (no installers), re-apply patches, print diff
scripts/check-design-skills.sh   frontmatter, lock, red-flag scan, gitleaks
```

## Updating a pin

1. Edit `sha` (and `version`) for the entry in `skills.lock`.
2. Run `scripts/sync-design-skills.sh --only <name>` (a dry run). Review the upstream diff, then check for new installers, network calls or env reads.
3. If a patch fails to apply, rebuild it: run with `--pristine --apply`, redo the edit, and regenerate the patch with `git diff --relative=<path>/`.
4. Run `scripts/sync-design-skills.sh --apply`, then `scripts/check-design-skills.sh`.

The sync script never runs `npm`, `pip`, `install.sh`, postinstall hooks or any upstream code. It only runs `git fetch` at the pinned SHA, with hooks disabled.

## Runtime notes per skill

- **impeccable.** The launcher (`scripts/impeccable`) downloads the engine binary for version 0.1.17 from the project's GitHub releases on first use and refuses to run it unless its sha256 matches `scripts/engine-checksums.txt`. Lev patch: the two fallbacks that ran an *unverified* binary were removed (`~/.impeccable/bin/impeccable` and `impeccable` on PATH), and the skill no longer suggests `impeccable update`. The `hooks` command writes agent settings files in a project, so only run it when the user asks for it.
- **hallmark.** The installers (`install.mjs`, `install-hook.mjs`) are removed. `scripts/imagegen.mjs` is opt-in and calls the Together AI image API only when the user has set a Together API key. Leave it unset unless image generation has been approved. `capture.mjs` and `picture.mjs` drive a local Chrome.
- **emil.** Markdown only.
- **design-md.** Runs `npx @google/design.md@0.4.0` with install scripts disabled.
- **ui-ux-pro-max.** Core only: local Python plus CSV and JSON data, no network. Upstream sub-skills with image generation and `.env` loading (`design`, `brand`, `banner-design`, `slides`, `ui-styling`) are not vendored, and neither are the tests.
- **taste-skill.** `scripts/assets.mjs` fetches public images from Openverse, the Met, the Art Institute of Chicago, NASA, archive.org, Wikimedia and picsum, and fonts from Google Fonts and Fontshare. No keys are needed. It writes history to `~/.taste-skill/`. The upstream `install.sh` (a symlink installer that auto-updates) is not vendored.
- **dimensional-drawing.** The headless motion adapter's `postinstall` (which downloads Chromium) is removed. Use `npm install --ignore-scripts` with an existing Chromium (`CHROMIUM_PATH`).
- **gsap.** The skill text is MIT. The GSAP library is under GreenSock's own "Standard No Charge" license, which is not OSI-approved. It is free for commercial use, but it bans no-code visual animation builders that compete with Webflow. Check it before shipping GSAP in a product.
