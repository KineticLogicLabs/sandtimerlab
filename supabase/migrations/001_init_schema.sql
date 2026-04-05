create table if not exists public.app_config (
  id uuid default gen_random_uuid() primary key,
  key text unique not null,
  value text not null
);

alter table public.app_config enable row level security;

drop policy if exists "Allow public read app_config" on public.app_config;

create policy "Allow public read app_config" 
on public.app_config for select 
using (true);

insert into public.app_config (key, value)
values ('lab_password_hash', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4')
on conflict (key) do nothing;
