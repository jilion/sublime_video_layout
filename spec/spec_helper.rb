require 'rubygems'
require 'bundler'

Bundler.require :default, :development, :test

require 'capybara/rspec'

Combustion.initialize! :action_controller, :action_view, :sprockets

require 'rspec/rails'
require 'capybara/rails'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
