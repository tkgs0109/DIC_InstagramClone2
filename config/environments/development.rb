Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true

  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.seconds.to_i}"
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.assets.debug = true
  config.assets.quiet = true
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  BetterErrors::Middleware.allow_ip! "0.0.0.0/0"

  config.action_mailer.default_url_options = { host: 'localhost:3000' }
  # config.action_mailer.delivery_method = :letter_opener

  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings =
  {
    user_name: ENV['SENDGRID_USERNAME'],
    password: ENV['SENDGRID_PASSWORD'],
    domain: "example.com",
    address: "smtp.SendGrid.net",
    port: 587,
    authentication: :plain,
    enable_starttls_auto: true
  }
end
