DeviseTokenAuth.setup do |config|
  config.change_headers_on_each_request = false
  config.check_current_password_before_update = :attributes
  config.default_confirm_success_url = '/'
  config.enable_standard_devise_support = false
  config.token_lifespan = 2.weeks
  config.max_number_of_devices = 10
  config.batch_request_buffer_throttle = 5.seconds
  config.omniauth_prefix = "/omniauth"
  config.default_callbacks = true
  config.send_confirmation_email = true
  config.redirect_whitelist = [ENV['CLIENT_BASE_URL']]
end
