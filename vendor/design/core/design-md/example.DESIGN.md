---
version: alpha
name: Example Studio
description: Calm, editorial product UI with one warm accent.
colors:
  primary: "#1F2A44"
  secondary: "#5B6475"
  tertiary: "#B3401F"
  neutral: "#F6F4EF"
  surface: "#FFFFFF"
  on-primary: "#FFFFFF"
  on-surface: "#1F2A44"
typography:
  headline-lg:
    fontFamily: Newsreader
    fontSize: 40px
    fontWeight: 600
    lineHeight: 1.15
    letterSpacing: -0.01em
  body-md:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: 400
    lineHeight: 1.5
  label-sm:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: 600
    lineHeight: 1.3
    letterSpacing: 0.04em
rounded:
  sm: 4px
  md: 8px
  full: 9999px
spacing:
  xs: 4px
  sm: 8px
  md: 16px
  lg: 32px
  xl: 64px
components:
  button-primary:
    backgroundColor: "{colors.primary}"
    textColor: "{colors.on-primary}"
    typography: "{typography.label-sm}"
    rounded: "{rounded.md}"
    padding: 12px
  button-primary-hover:
    backgroundColor: "{colors.secondary}"
  card:
    backgroundColor: "{colors.surface}"
    textColor: "{colors.on-surface}"
    rounded: "{rounded.md}"
    padding: 24px
  page:
    backgroundColor: "{colors.neutral}"
    textColor: "{colors.on-surface}"
  badge-accent:
    backgroundColor: "{colors.tertiary}"
    textColor: "{colors.on-primary}"
    typography: "{typography.label-sm}"
    rounded: "{rounded.full}"
    padding: 4px
---

## Overview

Quiet, editorial and confident. Generous whitespace, one serif for headlines, and a single warm accent used sparingly for the one action that matters on a screen.

## Colors

- **Primary (#1F2A44):** deep ink for headlines, primary buttons and core text.
- **Secondary (#5B6475):** slate for supporting text, borders and hover states.
- **Tertiary (#B3401F):** warm accent, reserved for one highlight per view.
- **Neutral (#F6F4EF):** paper-toned page background.

## Typography

Newsreader for headlines, Inter for body and labels. Labels are small caps-style: 12px, semibold, slightly tracked.

## Layout

8px base grid. Section rhythm uses `lg` (32px) inside cards and `xl` (64px) between page sections.

## Elevation & Depth

Flat by default. Depth comes from tonal layers (neutral page, white surface), not shadows.

## Shapes

Medium 8px corners on cards and buttons; full rounding only for pills and avatars.

## Components

Primary buttons are ink with white text and darken to slate on hover. Cards are white surfaces on the paper background with 24px padding.

## Do's and Don'ts

- Do keep the warm accent to one element per screen.
- Do meet WCAG AA contrast for all text.
- Don't mix more than two typefaces.
- Don't add drop shadows to cards.
