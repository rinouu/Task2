require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)

module Task2
  class Application < Rails::Application
    config.time_zone = 'Paris'
    config.active_record.default_timezone = :local
    config.i18n.default_locale = :fr
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.generators do |g|
      # The description in these two lines creates a Settings that is not automatically generated.
		g.assets false
		g.helper false
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end