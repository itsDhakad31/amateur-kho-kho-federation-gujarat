-- Fix admin user password hash
-- Run this in Supabase SQL Editor

DELETE FROM public.users WHERE email = 'admin@akkfg.com';

INSERT INTO public.users (name, email, password, role) 
VALUES (
  'Admin', 
  'admin@akkfg.com', 
  '$2b$10$5W/4MyXB4zdHhv2r4yPfhOII7gj4sxSB7etnWMnmZkz2XgbYqxgQq',
  'Admin'
);

SELECT 'Admin user updated!' as status;
