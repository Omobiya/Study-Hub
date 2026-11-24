## Connect Supabase

The repository includes an initial Supabase schema and a browser client helper. This is a setup scaffold; it does not create or link a hosted Supabase project on its own.

1. Create a Supabase project in your Supabase account.
2. Install the Supabase CLI and authenticate, then from this repository run:

   ```bash
   supabase login
   supabase link --project-ref YOUR_PROJECT_REF
   supabase db push
   ```

3. In the Supabase project settings, copy the project URL and publishable/anon key into a local `.env.local` file, using `.env.example` as the template. Add the same values to Vercel's project environment variables for Preview and Production, then redeploy.
4. Never put a Supabase service-role key in browser code or a `NEXT_PUBLIC_` variable. The schema enables row-level security for user-owned data and sets up a private `study-resources` bucket.

The initial frontend is still a landing page. Authentication screens and course/resource CRUD need to be implemented before students can use these backend tables from the UI.
