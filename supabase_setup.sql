-- FORM 2.0 Supabase setup
-- Run this in Supabase Dashboard → SQL Editor.
-- Enable Anonymous Sign-Ins in Authentication → Providers before connecting.
create table if not exists public.form_user_state (
  user_id uuid primary key references auth.users(id) on delete cascade,
  state_json jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.form_user_state enable row level security;

drop policy if exists "Users can read their own FORM state" on public.form_user_state;
create policy "Users can read their own FORM state"
on public.form_user_state for select to authenticated
using (auth.uid() = user_id);

drop policy if exists "Users can insert their own FORM state" on public.form_user_state;
create policy "Users can insert their own FORM state"
on public.form_user_state for insert to authenticated
with check (auth.uid() = user_id);

drop policy if exists "Users can update their own FORM state" on public.form_user_state;
create policy "Users can update their own FORM state"
on public.form_user_state for update to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

grant select, insert, update on public.form_user_state to authenticated;
