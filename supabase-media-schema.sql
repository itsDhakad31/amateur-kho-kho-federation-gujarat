-- Run this in the Supabase SQL Editor to enable admin photo/video uploads.

CREATE TABLE IF NOT EXISTS public.gallery_photos (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  title TEXT NOT NULL,
  category TEXT DEFAULT 'Tournament',
  image_path TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.gallery_videos (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  title TEXT NOT NULL,
  video_path TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE public.gallery_photos ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.gallery_videos ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Public read gallery photos" ON public.gallery_photos;
DROP POLICY IF EXISTS "Service role manage gallery photos" ON public.gallery_photos;
DROP POLICY IF EXISTS "Public read gallery videos" ON public.gallery_videos;
DROP POLICY IF EXISTS "Service role manage gallery videos" ON public.gallery_videos;

CREATE POLICY "Public read gallery photos"
ON public.gallery_photos
FOR SELECT
USING (true);

CREATE POLICY "Service role manage gallery photos"
ON public.gallery_photos
FOR ALL
USING (auth.role() = 'service_role')
WITH CHECK (auth.role() = 'service_role');

CREATE POLICY "Public read gallery videos"
ON public.gallery_videos
FOR SELECT
USING (true);

CREATE POLICY "Service role manage gallery videos"
ON public.gallery_videos
FOR ALL
USING (auth.role() = 'service_role')
WITH CHECK (auth.role() = 'service_role');
