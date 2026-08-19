-- GrowUP lead intake schema (reference only; applied to Supabase via migration)
create table if not exists public.growup_leads (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  store_name text not null,
  area text,
  contact_name text,
  contact_info text,
  score integer not null default 0 check (score between 0 and 100),
  estimated_hours integer not null default 0 check (estimated_hours between 0 and 500),
  hot boolean generated always as (score >= 80) stored,
  status text not null default 'new',
  priorities jsonb not null default '[]'::jsonb,
  answers jsonb not null default '{}'::jsonb,
  source text not null default 'dx_diagnosis',
  page_url text,
  user_agent text
);

alter table public.growup_leads enable row level security;
revoke all on table public.growup_leads from anon, authenticated;
grant insert on table public.growup_leads to anon;
grant select, insert, update, delete on table public.growup_leads to service_role;
