require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Xxx
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    config.chat_ids = %w[126953160 ] # 1198808944 - Ilya
    config.token = ENV['TELEGRAM_TOKEN'] ||= false
    config.i18n.default_locale = :ru
    
    # config.assets.paths << "#{Rails.root}/app/assets/videos"
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
