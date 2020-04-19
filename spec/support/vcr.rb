require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/vcr'
  config.allow_http_connections_when_no_cassette = true
  config.hook_into :webmock
  config.configure_rspec_metadata!

  config.filter_sensitive_data('<LOGIN_URL>') { ENV['LOGIN_URL'] }
  config.filter_sensitive_data('<LOGIN>') { ENV['STUDENT_1_LOGIN'] }
  config.filter_sensitive_data('<PASSWORD>') { ENV['STUDENT_1_PASSWORD'] }
  config.filter_sensitive_data('<SUBJECT_URL_1>') { ENV['SUBJECT_URL_1'] }
  config.filter_sensitive_data('<SUBJECT_URL_2>') { ENV['SUBJECT_URL_2'] }
  config.filter_sensitive_data('<REGULAR_CONTEXT_TEST_LOGOUT_URL>') { ENV['REGULAR_CONTEXT_TEST_LOGOUT_URL'] }
  config.filter_sensitive_data('<MY_SUBJECTS_CONTEXT_TEST_LOGOUT_URL>') { ENV['MY_SUBJECTS_CONTEXT_TEST_LOGOUT_URL'] }
  config.filter_sensitive_data('<PASSWORD_IN_RESPONSE_BODY>') { ENV['PASSWORD_IN_RESPONSE_BODY'] }
  config.filter_sensitive_data('<LOGIN_IN_RESPONSE_BODY>') { ENV['LOGIN_IN_RESPONSE_BODY'] }
end
