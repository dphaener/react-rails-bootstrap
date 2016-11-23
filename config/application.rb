require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module MyReactRailsApp
  class Application < Rails::Application
    config.autoload_paths += Dir["#{config.root}/app/graphql/**/"]
    config.autoload_paths += Dir["#{config.root}/app/presenters/**/"]
    config.autoload_paths += Dir["#{config.root}/app/services/**/"]

    config.api_only = true

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :options]
      end
    end

    config.generators do |g|
      g.orm :active_record, primary_key_type: :uuid
      g.fixture_replacement :factory_girl
      g.graphql :graphql
      g.presenter :presenter
      g.resolver :resolver
    end
  end
end
