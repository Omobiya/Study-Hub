# StudyHub

StudyHub is a mobile-friendly platform for students to privately organize course materials in one place. The MVP focuses on course folders, document uploads, external resource links, tags, search, and saved resources.

## Current status

A responsive Next.js landing page is included as the initial web application. The authenticated student dashboard, API, database, authentication, and file storage are not implemented yet; the screens shown in the page are illustrative only. A Supabase setup scaffold now defines the initial database schema, Row Level Security policies, and private storage bucket.

## Run locally

Requires Node.js 20 or newer.

```bash
npm install
npm run dev
```

Open http://localhost:3000.

## Supabase backend

Follow [the Supabase setup guide](docs/supabase-setup.md) to create and link a hosted project, apply the schema, and configure environment variables. A Supabase project and account authorization are required; this repository change does not deploy the hosted backend automatically.

## Deploy on Vercel

Import `Omobiya/Study-Hub` from Vercel and select the `main` branch. Use the Next.js preset and root directory `.`. Add the Supabase project URL and publishable/anon key to the Vercel environment before enabling Supabase-backed features. Vercel account access is required to create or configure the hosted project.

See [Architecture](docs/architecture.md) and the [Implementation Plan](docs/implementation-plan.md) for product context.
