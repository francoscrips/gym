# FORM 2.0 — Fitness & Nutrition PWA

A responsive dark-themed workout and nutrition tracker. This bundle includes a PWA shell, local-first storage, meal estimates, reusable saved meals, Open Food Facts barcode lookup, body-weight chart, weekly nutrition averages, workout templates, set logging, rest timer, volume/estimated-1RM analytics, data import/export, and optional Supabase cloud sync.

## Run locally

For simple testing, open `index.html` in a modern browser. LocalStorage works in normal browser contexts. PWA installation and service workers require HTTPS or `localhost`.

For PWA testing on your computer:
1. Install Node.js if needed.
2. In this folder, run `npx serve .` (or use another static server).
3. Open the local URL in Chrome/Safari. On iPhone/iPad, deploy over HTTPS and use Share → Add to Home Screen.

## GitHub Pages deployment

1. Create a GitHub repository.
2. Upload `index.html`, `manifest.webmanifest`, `icon.svg`, and `sw.js` to the repository root.
3. In Settings → Pages, deploy from the main branch/root.
4. Open the HTTPS Pages URL, then use your browser's Add to Home Screen option.

## Optional Supabase sync

1. Create a Supabase project.
2. In Authentication → Providers, enable **Anonymous Sign-Ins**.
3. Open SQL Editor and run `supabase_setup.sql`.
4. In Project Settings → API, copy the project URL and the publishable/anon key (never the service-role key).
5. In FORM, open Profile → Cloud sync, enter those values, and select Connect / sync.
6. Repeat on your other device. Supabase anonymous auth creates a distinct user per browser/device; this simple prototype does not link separate anonymous identities together automatically. To share one account across devices, add email/OTP sign-in and account linking before relying on multi-device sync.

### Important cloud-sync note
The current optional anonymous sign-in synchronizes data for the authenticated Supabase user. Different devices will initially have different anonymous identities unless you implement a shared sign-in method. The code is a prototype, not a substitute for a reviewed production auth implementation. Never place a Supabase service-role key in client-side code.

## AI nutrition endpoint

The app accepts an optional endpoint configured in the profile editor. It POSTs JSON shaped like:
```json
{
  "text": "2 eggs and toast",
  "foodsDB": [
    {"name":"Eggs","kcal":72,"protein":6.3,"carbs":0.4,"fat":4.8,"unit":"egg"}
  ]
}
```
The endpoint should return:
```json
{
  "items": [
    {"name":"Eggs","quantity":2,"meal":"Breakfast","calories":144,"protein":12.6,"carbs":0.8,"fat":9.6}
  ]
}
```
Keep provider API keys on the server, not in the static app. Configure a server-side proxy you control.

## Barcode scanning
Uses `BarcodeDetector` when available and camera permissions are granted. If not supported, type the barcode manually. Product data is fetched from the Open Food Facts public API; nutrition values are per 100 g when available and should be checked against the actual package serving.

## Nutrition / training caveats
- Built-in food references and generic meal estimates are approximate.
- Calorie targets use Mifflin–St Jeor and activity factors as a starting estimate, not medical advice.
- Estimated 1RM uses the Epley formula.
- This version stores data locally unless cloud sync is configured. Export a JSON backup regularly.
