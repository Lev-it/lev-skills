# Proposed retirements (needs Meir's OK; nothing is removed in this PR)

These skills under `.claude/skills/` overlap with the pinned pack in `vendor/design/`. Some are older, drifted copies of the same upstream. **This PR does not modify or delete any of them.** Retiring them is a separate change that needs approval, and it is best done when the pack is rolled out to agents, so no agent is left without a design skill.

| Existing skill | Source | Overlaps with | Why retire |
|---|---|---|---|
| `gpt-taste` | Leonxlnx/taste-skill (older) | `optional/taste-skill` + `optional/gsap` | Superseded by taste-skill 2.x; GSAP guidance is better served by the official GSAP skills. |
| `high-end-visual-design` | Leonxlnx/taste-skill (older) | `optional/taste-skill`, `core/hallmark` | Same family, older revision; conflicting house style. |
| `minimalist-ui` | Leonxlnx/taste-skill (older) | `optional/taste-skill`, `core/hallmark` | Style variant now covered by taste-skill directions / hallmark themes. |
| `industrial-brutalist-ui` | Leonxlnx/taste-skill (older) | `optional/taste-skill`, `core/hallmark` | As above. |
| `stitch-design-taste` | Leonxlnx/taste-skill (older) | `core/design-md` | Writes DESIGN.md for Stitch. `design-md` follows Google's spec and lints with the pinned CLI. |
| `hallmark` (v1.1.0) | nutlope/hallmark | `core/hallmark` (v2.0.0) | Older major version, same skill name. Having both installed would collide. |
| `emil-design-eng` | emilkowalski/skills (locally edited description) | `core/emil/emil-design-eng` | Drifted copy, same skill name. The pack ships the whole pinned set of 15 Emil skills. |

Also worth deciding at rollout (not proposed here, just flagged):

- `design-taste-frontend`: the existing skill has the same frontmatter `name` as `optional/taste-skill`. If the trial goes well, one of them has to go, or the vendored one gets renamed by a patch.
- Other taste-skill family members (`redesign-existing-projects`, `full-output-enforcement`, `image-to-code`, `imagegen-frontend-*`, `brandkit`) are unchanged and not covered by this pack.
