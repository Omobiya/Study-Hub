# StudyHub

StudyHub is a mobile-friendly platform for students to privately organize course materials in one place. The MVP focuses on course folders, document uploads, external resource links, tags, search, and saved resources.

## Current status

A responsive Next.js landing page is included as the initial web application. The authenticated student dashboard, API, database, authentication, and file storage are not implemented yet; the screens shown in the page are illustrative only.

## Run locally

Requires Node.js 20 or newer.

```bash
npm install
npm run dev
```

Open http://localhost:3000.

## Deploy on Vercel

1. Import `Omobiya/Study-Hub` from the Vercel dashboard and select the `main` branch.
2. Keep the framework preset as **Next.js** and the root directory as `.`.
3. No environment variables are required for this landing page. Select **Deploy**.
4. Subsequent commits to `main` will trigger deployments when the GitHub project is connected.

Vercel account access is required to create the hosted project and domain. See [Architecture](docs/architecture.md) and the [Implementation Plan](docs/implementation-plan.md) for the application baseline and planned MVP work.
