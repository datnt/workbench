Youtube::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true
  MY_YOUTUBE_CONFIG = {
    :client_id => "...",
    :client_secret => "...",
    :host_email => "change this to your email <in my case it is pe... beta... >@gmail.com",
    :dev_key => "AI39si6JOo9td85INUrLGu47_aszjShYhmF-m_PjRS6c9qR6BoTzt6XYdcxv5OPda15FegjSDPCgGigWgO4xj7zpTu9sKc_vTQ"
  }
  
end
