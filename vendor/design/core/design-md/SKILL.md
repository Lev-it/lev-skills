---
name: design-md
description: Write, update, lint, diff, and export a DESIGN.md file in Google's open design.md format (spec "alpha") so coding agents get exact design tokens plus the reasoning behind them. Use when the user asks for a DESIGN.md, a design system file for agents, design tokens in markdown, to document an existing UI's visual system, or to check, compare, or export a DESIGN.md. Pins the linter at @google/design.md@0.4.0.
license: "Skill text is Lev-authored. The DESIGN.md format and the @google/design.md CLI are by Google LLC, Apache-2.0"
metadata:
  upstream: https://github.com/google-labs-code/design.md
  upstream-commit: 6e5da5382f41edbba9d73b2c62f33f32e9971f15
  cli: "@google/design.md@0.4.0"
---

# design-md

DESIGN.md is a plain-text design system file that coding agents read before building UI. It has two layers:

1. **YAML front matter** with machine-readable tokens (normative values).
2. **Markdown body** with `##` sections that explain the intent (how and why to apply them).

The format and its CLI are by Google Labs (github.com/google-labs-code/design.md, Apache-2.0). This skill teaches the format and pins the CLI so results are reproducible. The spec is "alpha" and can change, so always lint with the pinned version below.

## Pinned linter

Always run the CLI at the pinned version, never `@latest`. Skip install scripts:

```bash
npm_config_ignore_scripts=true npx -y @google/design.md@0.4.0 lint DESIGN.md
```

| Command | What it does |
|---|---|
| `lint <file>` | Validates structure, references, contrast and section order. JSON output. Exit code 1 when there are errors. |
| `diff <before> <after>` | Reports token and section changes between two versions. Use this before you overwrite an existing DESIGN.md. |
| `export <file> --format <fmt>` | `css-tailwind` (Tailwind v4 `@theme`), `json-tailwind` / `tailwind` (v3 `theme.extend`), `dtcg` (W3C Design Tokens), `css-vars` (`--prefix` optional). |
| `spec [--rules] [--rules-only --format json]` | Prints the full spec or the lint rules for this version. Run it when you are unsure about a rule. |

Use `-` as the file to read from stdin. If npx is unavailable or has no network, say so and validate by hand against the rules below. Never claim a file passed lint unless you ran it.

## Front matter schema

```yaml
version: alpha            # optional
name: <string>            # required
description: <string>     # optional
colors:      { <token>: "#RRGGBB" }   # sRGB hex, quoted
typography:  { <token>: { fontFamily, fontSize, fontWeight, lineHeight, letterSpacing, fontFeature, fontVariation } }
rounded:     { <scale>: <dimension> }
spacing:     { <scale>: <dimension or number> }
components:  { <component>: { backgroundColor, textColor, typography, rounded, padding, size, height, width } }
```

- **Dimensions** carry a unit: `px`, `em` or `rem`. `lineHeight` may be unitless (e.g. `1.5`, the recommended form).
- **References** wrap a token path in braces: `"{colors.primary}"` or `"{typography.label-sm}"`. Inside `components` they may point to composite tokens such as a whole typography entry.
- **Color names:** `primary` is expected, plus `secondary`, `tertiary`, `neutral` and `on-*` pairs (`on-primary`, `on-surface`) for text that sits on a fill.
- **Typography names:** use a role-size pattern, such as `headline-lg`, `body-md` or `label-sm`.
- **Variants** are sibling component keys with a suffix, such as `button-primary`, `button-primary-hover` and `button-primary-active`.
- **No duplicates:** never repeat a top-level key. Duplicate keys or duplicate sections are errors.

## Body sections

Use these `##` headings in this exact order. Skip a section you have nothing to say about, but never reorder or repeat one:

1. `## Overview` (alias: Brand & Style): personality, audience, emotional tone.
2. `## Colors`: each palette role, its hex value and where it is used.
3. `## Typography`: families, the scale, and when to use each level.
4. `## Layout` (alias: Layout & Spacing): grid, base unit, rhythm.
5. `## Elevation & Depth`: shadows or tonal layering.
6. `## Shapes`: corner radii and shape language.
7. `## Components`: buttons, cards, inputs, chips and so on, with their states.
8. `## Do's and Don'ts`: short, concrete guardrails.

Prose explains; tokens decide. When prose and a token disagree, fix one of them so they match.

## Lint rules (v0.4.0)

| Rule | Severity | Fix |
|---|---|---|
| `broken-ref` | error | A `{path}` reference doesn't resolve, is circular, or uses an unknown component sub-token. |
| `missing-primary` | warning | Colors exist but there is no `primary`. |
| `contrast-ratio` | warning | A component's text/background pair is below WCAG AA (4.5:1). Adjust the color token, not the rule. |
| `orphaned-tokens` | warning | A token is never referenced by a component. Reference it or remove it. |
| `missing-typography` | warning | Colors exist but there are no typography tokens. |
| `section-order` | warning | Body sections are out of canonical order. |
| `unknown-key` | warning | A top-level key looks like a typo of a schema key. |
| `token-like-ignored` | warning | A token-like map sits under a key the exporter ignores. Move it under a known key. |
| `missing-sections`, `token-summary`, `omitted-rules` | info | Informational only. |

**Target:** 0 errors and 0 warnings. Explain any warning you leave in place.

## Workflow

**Writing a new DESIGN.md**

1. Gather the real values. Read the project's CSS variables, Tailwind config, theme files or a brand guide the user gives you. Do not invent hex codes for an existing product. Ask, or mark a value as a proposal.
2. Write the front matter first, then the body sections in order. Keep the body short and specific.
3. Make every color and type token earn its place by referencing it from at least one component (this avoids `orphaned-tokens`).
4. Lint, fix, and lint again until there are 0 errors and 0 warnings.
5. Report the lint summary. If the user wants code tokens, run `export` too.

**Updating an existing DESIGN.md**

1. Copy the original aside.
2. Edit the file.
3. Run `diff old new` and show the user the token changes.
4. Lint.

**Reviewing a DESIGN.md**

Lint it, then check that the prose matches the tokens and that every `on-*` pair passes contrast.

## Example

`example.DESIGN.md` next to this file is a complete, lint-clean example (0 errors, 0 warnings at v0.4.0) for a fictional brand. Copy its shape, not its values.

## Boundaries

- Only write DESIGN.md, plus exported token files the user asked for. Do not restyle the app as a side effect.
- Never put secrets, internal URLs or environment details in a DESIGN.md. It is meant to be shared.

## Attribution

The DESIGN.md format, spec and `@google/design.md` CLI are © Google LLC, licensed under Apache-2.0: https://github.com/google-labs-code/design.md (spec read at commit 6e5da538). A copy of that license is in `vendor/design/LICENSES/design-md-LICENSE`. This skill is an independent summary written for Lev; it does not copy the spec text. When in doubt, `npx @google/design.md@0.4.0 spec` is the source of truth.
