# Jaydeo Sawale Portfolio

Public portfolio: https://jaydeo-sawale-portfolio.vercel.app

The public site is static HTML, CSS and a small progressive-enhancement script. Each case study has its own URL, canonical metadata and readable HTML without JavaScript. No external package dependencies are required for the build.

## Build and preview

Requires Node.js 20 or later.

```sh
npm run build
python3 -m http.server 8765 --directory dist
```

Content is in `site/projects.json` and `scripts/build.mjs`. Styles and mobile navigation are in `site/style.css` and `site/app.js`. Vercel builds and publishes `dist/`. APK downloads use GitHub release assets; the resume PDF is served from `/downloads/`.

The original Flutter portfolio source remains in `frontend/` for reference. It is not the production public-site build. Existing backend/API files are retained.

## Content and assets

- Professional Kotlin/Flutter work is distinguished from independent AI/backend projects.
- MessageShield evaluation describes a held-out split of curated data, not production detection accuracy.
- The LegalLens screenshot is labelled as a sample-data screen preview.
- Travel Planner and LegalLens APKs are demo builds and do not update automatically when source changes.
- The completed certificate includes its verification URL and ID. Expected November 2026 credentials remain in progress.
- The checked resume is in `site/downloads/`.

Before publishing, build and check desktop/mobile layouts, case-study links, resume downloads and APK release assets.
