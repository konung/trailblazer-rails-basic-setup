require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
#require 'action_view/railtie'
#require 'action_cable/engine'
# require 'sprockets/railtie'
require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TrailblazerRailsBasicSetup
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.time_zone = 'Central Time (US & Canada)'

    config.generators do |g|
      g.template_engine :haml
      g.test_framework :minitest #, spec: true, fixture: true
    end

    # config.active_job.queue_adapter = :delayed_job
  end
end
