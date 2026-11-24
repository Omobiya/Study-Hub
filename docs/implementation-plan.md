# StudyHub MVP Implementation Plan

**Planning horizon:** Six weeks, organized as two three-week phases. Dates, staffing, and estimates are planning assumptions and should be confirmed by the product team.

## Phase 1 — Core platform (Weeks 1–3)

**Outcome:** Students can create accounts, manage private courses, and add resources.

| Week | Focus | Deliverables |
|---|---|---|
| 1 | Confirm requirements and decisions; establish Next.js, NestJS, PostgreSQL, migrations, CI, API contract, and prototype | Approved baseline, runnable development setup, initial schema and prototype |
| 2 | Registration, sign-in/out, password recovery, profile, and course CRUD | Account flows and private course management |
| 3 | Private storage, supported file uploads, external links, validation, and resource lifecycle | Document and link management with recoverable upload errors |

### Phase 1 exit criteria

- Users can register, sign in, and sign out.
- Users can create and manage their own course folders.
- Users can upload supported documents or save external links.
- Unsupported or oversized files are rejected.
- Cross-user access is denied by server-side authorization.
- Authentication, ownership, and core database tests pass.

## Phase 2 — Discovery, quality, and pilot (Weeks 4–6)

**Outcome:** Students can find and organize resources, and the MVP is ready for pilot evaluation.

| Week | Focus | Deliverables |
|---|---|---|
| 4 | Search, tags, saved resources, responsive refinements, dashboard updates | Functional MVP journeys |
| 5 | Integration, security, and responsive testing; backups, monitoring, and defect fixes | Stable pilot candidate and documented recovery procedures |
| 6 | Pilot preparation and usability evaluation | Pilot findings, measurements, and prioritized follow-up backlog |

### Phase 2 exit criteria

- Students can search, tag, save, and open their own resources.
- Core journeys work on supported mobile and desktop devices.
- Authentication, permissions, and upload-security tests pass.
- Backups and recovery procedures are documented.
- No critical or high-severity defects remain for the pilot.
- Pilot findings and baseline measurements are recorded.

## Pilot evaluation

Proposed tasks:

1. Register and sign in.
2. Create a course.
3. Upload a PDF and add a resource link.
4. Add a tag, search for a resource, open it, and save it.

Measure task completion, resource retrieval time, and user satisfaction. Treat targets as proposed until a baseline has been collected. The earlier product notes suggest a 4–6 week pilot with 4–6 participants; confirm recruitment and timing before scheduling.

## Definition of done

- Acceptance criteria pass.
- API authorization is enforced and tested.
- Loading, empty, validation, and error states are present in the UI.
- Relevant unit, integration, or end-to-end tests are included.
- Security-sensitive behavior is tested.
- Documentation is updated and changes are reviewed.
- Database changes are reproducible through migrations.

## Deferred beyond the MVP

AI explanations and generated questions, video delivery, discussion forums, advanced analytics, paid subscriptions, institutional integrations, and offline resource synchronization.
