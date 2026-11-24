# StudyHub

StudyHub is a mobile-friendly platform for students to privately organize course materials in one place. The MVP focuses on course folders, document uploads, external resource links, tags, search, and saved resources.

> **Repository status:** This repository currently contains the product and architecture baseline. The application implementation has not yet been added.

## MVP scope

- Student registration, sign-in, sign-out, and password recovery
- Private course management
- Upload and manage supported documents
- Save and manage external resource links
- Search resources by title, course, and keyword
- Organize resources with tags and save resources for later
- Responsive mobile and desktop experience

AI tutoring, generated questions, video delivery, discussion forums, advanced analytics, subscriptions, institutional integrations, and offline synchronization are deferred beyond the MVP.

## Proposed technology baseline

- **Web:** React with Next.js and Tailwind CSS
- **API:** NestJS modular monolith with versioned REST endpoints
- **Database:** Managed PostgreSQL
- **Authentication:** Supabase Auth or an equivalent managed provider (decision pending)
- **File storage:** Private S3-compatible object storage with short-lived signed URLs
- **Search:** PostgreSQL full-text search for the MVP

See [Architecture](docs/architecture.md) and the [Implementation Plan](docs/implementation-plan.md) for additional detail and open decisions.

## Core student journey

`Register → Sign In → Create Course → Upload Material → Organize → Search → Open → Save`

## Development status

The next step is to confirm the open architecture and product decisions, then scaffold the frontend, API, database migrations, and automated checks. No application code or deployment is included in this initial baseline.
