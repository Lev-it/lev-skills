---
name: amicro
description: Premium React micro-interactions, transition components, and animated card layouts from the @subhanhq/amicro library, powered by motion/react. Use when building React/Next.js/Vite UIs that need animated card decks (arc, fan, carousel, cover-flow, time-machine stacks), entrance transitions (fade-in, fade-up, zoom-in), or hover micro-interactions. Triggers on "add a card carousel", "animated card stack", "fan/arc card layout", "cover flow", "entrance animation", "micro-interaction", or any request to install/use Amicro components.
---

# Amicro — Micro-interactions & Transitions

`@subhanhq/amicro` is a curated collection of premium React micro-interactions, transition components, and animated card layouts. Components are hardware-accelerated (powered by `motion/react`) and **copied directly into your codebase** (shadcn-style) rather than imported from a runtime package, so they're fully editable and support both dark and light themes.

Source: https://github.com/Subhan-code/Amicro--Micro-transitions-

## When to use

Reach for Amicro when a React UI needs polished, ready-made motion:

- **Animated card decks** — arc, fan, cascade, scatter, and stack layouts that expand/deal on hover.
- **3D carousels** — interactive carousel, CoverFlow, Apple-style time-machine stack with timeline controls.
- **Entrance transitions** — `fade-in`, `fade-up`, `zoom-in` and similar reveal effects.
- **Hover micro-interactions** and small motion utilities.

## Prerequisites

- **Node.js** ≥ 18
- **React** 18+ or 19+
- **Tailwind CSS** v3 or v4
- **Motion** — `motion/react` (or `framer-motion`) as a peer dependency

## Installation & CLI

Amicro ships its own CLI to scaffold and add components:

```bash
# Initialize Amicro in a React / Next.js / Vite project
npx @subhanhq/amicro@latest init

# Add a specific component (copies it into your project)
npx @subhanhq/amicro@latest add <name>
```

Or install the package directly:

```bash
npm install @subhanhq/amicro
# yarn add @subhanhq/amicro   |   pnpm add @subhanhq/amicro
```

### shadcn/ui registry

Amicro is also exposed as a shadcn registry. Add the namespace to `components.json`:

```json
{
  "registries": {
    "@amicro": "https://raw.githubusercontent.com/Subhan-code/Amicro--Micro-transitions-/main/registry/{name}.json"
  }
}
```

Then install any component through shadcn:

```bash
npx shadcn add @amicro/fade-in
```

## Card layout catalog

12 card interaction patterns are available:

| Component | Behavior |
|---|---|
| **ARC (5-card / 7-card / long-form)** | Curved arc layouts in three densities. |
| **Linear Spread** | Horizontal card sliding, no rotation. |
| **Corner Fan** | Radial spread anchored at bottom-left. |
| **Stamp Arc** | Perforated stamp-style cards with dynamic controls. |
| **Cascade Stagger** | Vertically staggered diagonal deployment. |
| **Scatter Spread** | Overlapping dealt-hand layout on hover. |
| **Wheel Fan** | Semi-circular radial expansion. |
| **3D Carousel** | Interactive rotating 3D carousel. |
| **CoverFlow** | Premium cover-flow variant. |
| **Time Machine Stack** | Apple-style stacked deck with timeline controls. |

## Workflow

1. Confirm the project meets the prerequisites (React 18/19, Tailwind, `motion/react` installed).
2. Run `npx @subhanhq/amicro@latest init` once per project (or wire up the shadcn registry).
3. Add the specific component you need with `add <name>` — pick the exact name from the Amicro docs/registry, since components are copied in verbatim.
4. Import the copied component and pass your content/config; edit the copied source freely to match the design system.

> Exact `add <name>` slugs live in the Amicro registry (`registry/*.json` in the source repo). Check the repo's README/registry for the current name list before running `add`, rather than guessing a slug.
