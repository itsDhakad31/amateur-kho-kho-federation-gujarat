-- Fix RLS policies for users table
-- Run this in Supabase SQL Editor

-- Drop old user policies
DROP POLICY IF EXISTS "Service role all users" ON public.users;

-- Create new policies for users table
CREATE POLICY "Service role insert users" ON public.users FOR INSERT WITH CHECK (auth.role() = 'service_role');
CREATE POLICY "Service role select users" ON public.users FOR SELECT USING (auth.role() = 'service_role' OR email = auth.jwt()->>'email');
CREATE POLICY "Service role update users" ON public.users FOR UPDATE USING (auth.role() = 'service_role');

-- Also allow public insert for registration (using anon key)
CREATE POLICY "Public insert users" ON public.users FOR INSERT WITH CHECK (true);

SELECT 'Policies updated!' as status;
