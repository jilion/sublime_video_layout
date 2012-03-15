require 'rubygems'
require 'bundler'

Bundler.require :default, :development, :test

require 'capybara/rspec'

Combustion.initialize! :action_controller, :action_view, :sprockets

require 'rspec/rails'
require 'capybara/rails'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
end
