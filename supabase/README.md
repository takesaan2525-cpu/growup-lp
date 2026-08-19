# GrowUP lead capture

The DX diagnosis page stores submissions in `public.growup_leads`.

Security model:
- public/anon: INSERT only
- no public SELECT/UPDATE/DELETE
- RLS enabled
- HOT is generated when score >= 80
