# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_testtesting_session',
  :secret      => '55e5534b7c38b9975829a2d024c306d27daf33f8826f0b8e5acd419065ea409e93fd8831380d053c856e127eb1fd58d000588e80d11f35e199c62d76258328b5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
