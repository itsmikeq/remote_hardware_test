# Be sure to restart your server when you modify this file.

RemoteHardwareTest::Application.config.session_store :cookie_store, key: '_remote_hardware_test_session'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# RemoteHardwareTest::Application.config.session_store :active_record_store
# RemoteHardwareTest::Application.config.middleware.insert_before(
  # RemoteHardwareTest::Application.config.session_store :cookie_store, 
  # FlashSessionCookieMiddleware
  # # RemoteHardwareTest::Application.config.session_store :cookie_store,
  # # ActiveRecord::Base.session_options[:key]
# )