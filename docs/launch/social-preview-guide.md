# Social Preview Image Guide

## Overview

When PitchDocs links are shared on Twitter/X, Slack, Discord, or LinkedIn, GitHub displays a social preview image. This image is the first visual impression — it drives clicks and shares.

## Technical Specifications

- **Dimensions:** 1280 × 640 pixels (2:1 aspect ratio)
- **File format:** PNG or JPEG (PNG recommended for crisp text)
- **File size:** Under 1MB, ideally <300KB (smaller = faster load)
- **Upload location:** GitHub repository settings > Social preview
- **Supported platforms:** Twitter/X, Slack, Discord, LinkedIn, Reddit, Mastodon

## Design Recommendations

### Essential Elements

1. **Project Name (Large, Bold)**
   - Font size: 72–96pt
   - Position: Upper half, centred or left-aligned
   - Ensure legibility at thumbnail size (~300×150px on mobile)

2. **One-Line Value Proposition**
   - Font size: 32–48pt
   - Subtitle below the project name
   - Example: "Generate production-grade docs from any codebase"
   - Keep to 60 characters max for clarity

3. **Visual Element (Logo or Icon)**
   - PitchDocs logo (80×80px to 160×160px)
   - Position: Corner or behind text as watermark
   - Ensure contrast with background

4. **Color Scheme**
   - Use PitchDocs brand colours (check docs/assets/)
   - High contrast between text and background
   - Test on both dark and light backgrounds (some platforms invert)

### Layout Principles

- **Centre critical content** — platforms crop differently; keep the message in the center 60% of the image
- **Minimal text** — max 3 lines (project name + value prop + optional tagline)
- **Asymmetric balance** — position logo in corner, text in opposite quadrant
- **Readable at 300×150px** — simulate thumbnail view while designing

### Anti-Patterns

- ❌ Dense text or long sentences
- ❌ Tiny font (unreadable at thumbnail size)
- ❌ Dark text on dark background (no contrast)
- ❌ Blurry or low-res graphics
- ❌ Content in outer edges (will be cropped)

## Example Layout

```
┌─────────────────────────────────────────────────────────────────┐
│                                                      📦         │
│                                                                 │
│            PitchDocs                                            │
│                                                                 │
│   Generate production-grade docs from any codebase             │
│                                                                 │
│   Works with 9 AI tools • Evidence-based • Professional        │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

## Tools for Creation

### Canva (Easiest for Non-Designers)
1. Go to [canva.com](https://canva.com/)
2. Search template: "GitHub social preview" or "1280x640"
3. Customise with project name, value prop, colours, logo
4. Download as PNG
5. Upload to GitHub Settings > Social preview

**Pros:** Drag-and-drop, templates, no design experience needed
**Cons:** Watermark on free tier, limited customisation

### Figma (Most Flexible)
1. Create new 1280×640 canvas
2. Design using brand colours, typography, logo
3. Export as PNG (right-click layer > Export)
4. Upload to GitHub

**Pros:** Precise control, reusable components, shareable with team
**Cons:** Steeper learning curve

### Command-Line Generators
For programmatic generation (Node.js/Python):
- [vercel/og-image](https://github.com/vercel/og-image) — Open Graph image generation
- [GitHub's social preview API](https://docs.github.com/en/rest/repos/repos#update-repository) — Programmatically set preview

## How to Upload to GitHub

1. **Create the image** (1280×640 PNG, <1MB)
2. Navigate to: **Settings > General > Social preview**
3. Click **Upload an image**
4. Select the PNG file
5. **Save changes**

The preview will now appear on all GitHub shares (Twitter/X, Slack, Discord, LinkedIn, etc.).

## Testing & Validation

Before uploading, test your design:

1. **Thumbnail test:** Resize to 300×150px in your design tool — is it still legible?
2. **Contrast test:** Convert to grayscale — is the hierarchy clear without colour?
3. **Mobile test:** View on phone screen — are text and logo readable?
4. **Platform preview:** Use Twitter Card Validator (cards-dev.twitter.com/validator) to see how it renders

## Content-Specific Recommendations for PitchDocs

**Design brief for social preview:**
- **Primary text:** "PitchDocs" (bold, 80pt+)
- **Secondary text:** "Ship production-grade docs" (subtitle, 40pt)
- **Visual:** Logo in top-right corner (80×80px) or as faint watermark
- **Colour:** Use project brand colours (deep blue + white for contrast)
- **Tagline (optional):** "Works with 9 AI tools" (20pt, smaller)

**Example tagline variants:**
- "Generate docs from code"
- "Evidence-based documentation"
- "AI-powered doc generation"
- "For Claude Code, OpenCode, Cursor..."

---

## Quick Checklist

- [ ] Image is exactly 1280×640 pixels (2:1 ratio)
- [ ] File is PNG or JPEG, under 1MB
- [ ] Text is legible at 300×150px thumbnail size
- [ ] Project name is prominent and readable
- [ ] Value proposition is clear and concise
- [ ] Logo/icon is visible but not overwhelming
- [ ] Background and text have good contrast
- [ ] Critical content is centred (60% of image)
- [ ] Tested on Twitter Card Validator
- [ ] Uploaded to GitHub Settings > Social preview

---

## Post-Launch: Monitor Performance

After uploading, monitor how your social preview performs:

- **Twitter/X:** Check tweet impressions with preview vs without
- **Slack:** Share link in workspace and note engagement
- **LinkedIn:** Post with GitHub link, track click-through rate
- **Reddit:** Share in relevant subreddits, observe upvotes

If engagement is low, iterate on the design (maybe the value proposition isn't clear, or the image is too dense).
