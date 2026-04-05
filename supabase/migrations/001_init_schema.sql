create table if not exists public.trials (
  id bigint primary key,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  timestamp text not null,
  grid_summary text,
  grid_data jsonb,
  hole_index integer,
  hole_label text,
  duration text not null,
  comment text
);

alter table public.trials enable row level security;

create policy "Enable access for all users" 
on public.trials for all 
using (true) 
with check (true);
