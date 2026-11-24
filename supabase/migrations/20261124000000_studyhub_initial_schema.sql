-- StudyHub starter schema for Supabase. Apply with `supabase db push`.
-- All user-owned records are protected with Row Level Security.

create table public.courses (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users (id) on delete cascade,
  name text not null check (char_length(name) between 1 and 120),
  code text check (code is null or char_length(code) <= 32),
  description text check (description is null or char_length(description) <= 1000),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index courses_user_id_idx on public.courses (user_id);

create table public.resources (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users (id) on delete cascade,
  course_id uuid not null references public.courses (id) on delete cascade,
  title text not null check (char_length(title) between 1 and 200),
  description text check (description is null or char_length(description) <= 2000),
  resource_type text not null check (resource_type in ('file', 'link')),
  status text not null default 'available' check (status in ('pending_upload', 'available', 'failed')),
  storage_path text,
  external_url text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint resource_location_matches_type check (
    (resource_type = 'file' and storage_path is not null and external_url is null)
    or (resource_type = 'link' and external_url is not null and storage_path is null)
  )
);

create index resources_user_course_idx on public.resources (user_id, course_id);
create index resources_title_idx on public.resources using gin (to_tsvector('simple', title));

create table public.tags (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users (id) on delete cascade,
  name text not null check (char_length(name) between 1 and 40),
  created_at timestamptz not null default now(),
  unique (user_id, name),
  unique (id, user_id)
);

create table public.resource_tags (
  resource_id uuid not null references public.resources (id) on delete cascade,
  tag_id uuid not null,
  user_id uuid not null references auth.users (id) on delete cascade,
  created_at timestamptz not null default now(),
  primary key (resource_id, tag_id),
  foreign key (resource_id, user_id) references public.resources (id, user_id) on delete cascade,
  foreign key (tag_id, user_id) references public.tags (id, user_id) on delete cascade
);

create table public.saved_resources (
  user_id uuid not null references auth.users (id) on delete cascade,
  resource_id uuid not null,
  created_at timestamptz not null default now(),
  primary key (user_id, resource_id),
  foreign key (resource_id, user_id) references public.resources (id, user_id) on delete cascade
);

alter table public.courses enable row level security;
alter table public.resources enable row level security;
alter table public.tags enable row level security;
alter table public.resource_tags enable row level security;
alter table public.saved_resources enable row level security;

create policy "Students manage their own courses"
  on public.courses for all to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

create policy "Students manage their own resources"
  on public.resources for all to authenticated
  using (auth.uid() = user_id)
  with check (
    auth.uid() = user_id
    and exists (
      select 1 from public.courses
      where courses.id = resources.course_id and courses.user_id = auth.uid()
    )
  );

create policy "Students manage their own tags"
  on public.tags for all to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

create policy "Students manage their own resource tags"
  on public.resource_tags for all to authenticated
  using (auth.uid() = user_id)
  with check (
    auth.uid() = user_id
    and exists (
      select 1 from public.resources
      where resources.id = resource_tags.resource_id and resources.user_id = auth.uid()
    )
    and exists (
      select 1 from public.tags
      where tags.id = resource_tags.tag_id and tags.user_id = auth.uid()
    )
  );

create policy "Students manage their own saved resources"
  on public.saved_resources for all to authenticated
  using (auth.uid() = user_id)
  with check (
    auth.uid() = user_id
    and exists (
      select 1 from public.resources
      where resources.id = saved_resources.resource_id and resources.user_id = auth.uid()
    )
  );

-- Private bucket for uploaded course materials. Store objects under {auth.uid()}/... paths.
insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values (
  'study-resources',
  'study-resources',
  false,
  26214400,
  array['application/pdf', 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'application/vnd.ms-powerpoint', 'application/vnd.openxmlformats-officedocument.presentationml.presentation']
)
on conflict (id) do nothing;

create policy "Students read their own study files"
  on storage.objects for select to authenticated
  using (bucket_id = 'study-resources' and (storage.foldername(name))[1] = auth.uid()::text);

create policy "Students upload their own study files"
  on storage.objects for insert to authenticated
  with check (bucket_id = 'study-resources' and (storage.foldername(name))[1] = auth.uid()::text);

create policy "Students update their own study files"
  on storage.objects for update to authenticated
  using (bucket_id = 'study-resources' and (storage.foldername(name))[1] = auth.uid()::text)
  with check (bucket_id = 'study-resources' and (storage.foldername(name))[1] = auth.uid()::text);

create policy "Students delete their own study files"
  on storage.objects for delete to authenticated
  using (bucket_id = 'study-resources' and (storage.foldername(name))[1] = auth.uid()::text);
