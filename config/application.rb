require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module RailsBlogApp
  class Application < Rails::Application
    config.load_defaults 7.0

    # Add this line to autoload the lib directory
    config.autoload_paths << Rails.root.join('lib')
  end
end
