require File.expand_path("../boot", __FILE__)
require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you have limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Fitbird
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run rake -D time for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = "Central Time (US & Canada)"

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join("my", "locales", "*.{rb,yml}").to_s]
    # config.i18n.default_locale = :de

    # Enable escaping HTML in JSON.
    config.active_support.escape_html_entities_in_json = true

    # Compile images in assets.
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)

    # Allow Cross-Origin Resource Sharing requests.
    config.middleware.insert_before 0, "Rack::Cors" do
      allow do
        origins "http://localhost:8000"
        resource "*",
          :headers => :any,
          :methods => [:get, :post, :patch, :put, :delete, :options]
      end
    end
  end
end
