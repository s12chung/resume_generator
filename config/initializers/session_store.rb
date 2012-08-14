# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_resume-generator_session',
  :secret      => 'ddeb14209cf0d179fff2ce99785872a4911484d8bf9e962cbdc833eb948c8f4eacf354a6f8a4c1893082957c0d4dbea6ef5443585ee2d778ccc82f7791eb9b51'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
