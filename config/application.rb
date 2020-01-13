require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DeviseApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.action_controller.include_all_helpers = false
    # --- Modal ----
    config.web_console.whitelisted_ips = '109.240.107.85'
    config.web_console.whitelisted_ips = '167.88.61.92'
    config.web_console.whiny_requests = false
    # --------------
  end
end
