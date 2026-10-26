# Third-party notices: vendor/design

Every component below is copied at the commit shown. License texts are kept verbatim in `LICENSES/`. "Lev changes" lists everything that differs from upstream. The exact diffs are in `patches/`, and `skills.lock` is the machine-readable source of truth.

| Component | Upstream | Commit | Version | License | Vendored path | Lev changes |
|---|---|---|---|---|---|---|
| Impeccable | https://github.com/pbakaus/impeccable (`.claude/skills/impeccable`) | `989c484c091d26f10fa102767eefc0da2e62ec67` | 4.7.1, engine 0.1.17 | Apache-2.0 (`LICENSES/impeccable-LICENSE`, `LICENSES/impeccable-NOTICE.md`) | `core/impeccable` | Patched: removed the unverified engine fallbacks from the launcher, removed `impeccable update` suggestions, added a pinned-copy note. See `NOTICE`. |
| Hallmark | https://github.com/Nutlope/hallmark (`skills/hallmark`) | `7ec868225c6caa040558c321ee0fefa0e73f83a8` | 2.0.0 | MIT (`LICENSES/hallmark-LICENSE`, also in the skill folder) | `core/hallmark` | Stripped `scripts/install.mjs` and `scripts/install-hook.mjs`. Patched `references/flow.md` to stop pointing at the hook installer. |
| Emil Kowalski skills | https://github.com/emilkowalski/skills (`skills/`) | `2d228630ba1446365f614a108cb8252f1feda202` | by commit | MIT (`LICENSES/emil-skills-LICENSE`) | `core/emil` | None |
| DESIGN.md format and CLI | https://github.com/google-labs-code/design.md | `6e5da5382f41edbba9d73b2c62f33f32e9971f15` | spec alpha, CLI 0.4.0 | Apache-2.0 (`LICENSES/design-md-LICENSE`) | `core/design-md` (Lev-authored skill, no upstream files) | Not vendored. Our skill runs `npx @google/design.md@0.4.0`. |
| UI/UX Pro Max (core) | https://github.com/nextlevelbuilder/ui-ux-pro-max-skill (`.claude/skills/ui-ux-pro-max`) | `28b3b8dee8c976df4fa3e94aed4e092ad43fcb03` | 2.15.0 | MIT (`LICENSES/ui-ux-pro-max-LICENSE`) | `optional/ui-ux-pro-max` | Stripped `scripts/tests`. Patched `SKILL.md` paths (`${CLAUDE_PLUGIN_ROOT}` changed to `<skill-dir>`). Sub-skills with image generation and `.env` loading were not copied. |
| Taste Skill | https://github.com/Leonxlnx/taste-skill (`skills/taste-skill`) | `12af471f627f866411b4bd785b19646d3672784c` | 2.1.5 | MIT (`LICENSES/taste-skill-LICENSE`) | `optional/taste-skill` | None. The repo-root `install.sh` was not copied. |
| Dimensional Drawing | https://github.com/enesozturk/dimensional-drawing (`skills/`) | `5c457437c8c83524308aad3b7443e81adcc13153` | by commit | MIT (`LICENSES/dimensional-drawing-LICENSE`) | `optional/dimensional-drawing` | Removed the `postinstall: playwright install chromium` step. The docs now say `npm install --ignore-scripts`. |
| GSAP skills | https://github.com/greensock/gsap-skills (`skills/`) | `aed9cfd3277740755f6bfc1155c7aa645403b760` | by commit | MIT for the skill text (`LICENSES/gsap-skills-LICENSE`) | `optional/gsap` | None. **Note:** the GSAP library these skills teach is under GreenSock's own Standard "No Charge" license (https://gsap.com/standard-license), not MIT. That license is free for commercial use but forbids using GSAP in no-code visual animation builders that compete with Webflow. |

Impeccable's upstream NOTICE also credits ehmo/platform-design-skills (MIT) for its iOS and Android reference files. That credit is kept in `LICENSES/impeccable-NOTICE.md`.

## Deliberately not included

| Project | Why |
|---|---|
| react-bits, canvas-ui | Their license adds the Commons Clause, so they are not open source and are kept out of this repo. |
| magicui | A component library, not a design skill. Its skill runs live `npx shadcn@latest` registry fetches. Use it per project instead. |
| scroll-world | Its skill uploads brand imagery with `curl -T` to a third-party service and runs pay-per-clip AI video jobs. |
| open-design | A full desktop app with a heavy `postinstall`, not a skill. |
| awesome-design-md | DESIGN.md files describing other companies' brands. Use it as reference reading only. |
| ui-ux-pro-max sub-skills (`design`, `brand`, `banner-design`, `slides`, `ui-styling`) | Their image-generation scripts read API keys from `~/.claude/.env` and call third-party image APIs. |
| All upstream installers (`install.sh`, `install.mjs`, `install-hook.mjs`, `npx skills add`, `npx impeccable install/update`, postinstall hooks) | They write into agent config directories or auto-update. Everything here is copied by `scripts/sync-design-skills.sh` only. |
