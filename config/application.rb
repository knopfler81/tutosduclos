require File.expand_path('../boot', __FILE__)

require 'rails/all'
require "sprockets/railtie"
require 'attachinary/orm/active_record'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Tutos
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.test_framework :rspec
    end
  end

end
