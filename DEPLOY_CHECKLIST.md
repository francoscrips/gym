# FORM 2.0 launch checklist

- [ ] Test onboarding and calorie/macros on desktop and mobile.
- [ ] Test meal add/edit/delete and saved meal reuse.
- [ ] Test workout templates, set completion, rest timer, finish/cancel.
- [ ] Test weight logging, calendar history, weekly averages, and analytics.
- [ ] Deploy over HTTPS before testing PWA install/offline shell.
- [ ] Run `supabase_setup.sql` only if enabling cloud sync.
- [ ] Enable Supabase Anonymous Sign-Ins before using cloud sync.
- [ ] Use only the Supabase publishable/anon key in the browser.
- [ ] Add a reviewed shared authentication flow before expecting sync across separate devices.
- [ ] Configure a secure server-side AI proxy if using an external LLM.
- [ ] Export a backup and verify import before using as your only record.
