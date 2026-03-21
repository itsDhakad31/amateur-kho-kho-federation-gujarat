import { createClient } from '@supabase/supabase-js'

const supabaseUrl = process.env.SUPABASE_URL || ''
const supabaseAnonKey = process.env.SUPABASE_ANON_KEY || ''
const supabaseServiceRole = process.env.SUPABASE_SERVICE_ROLE_KEY || ''

export const supabase = createClient(supabaseUrl, supabaseAnonKey)

// Server-side client using the service_role key (required for storage uploads / admin operations)
// If the service role key is not present, we fall back to the anon client but log a warning.
export const supabaseAdmin = supabaseServiceRole
	? createClient(supabaseUrl, supabaseServiceRole)
	: supabase

if (!supabaseServiceRole) {
	// eslint-disable-next-line no-console
	console.warn('Warning: SUPABASE_SERVICE_ROLE_KEY is not set. Server-side storage/uploads may fail due to RLS.');
}
