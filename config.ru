require 'rubygems'
require 'bundler'

Bundler.require :default, :development

Combustion.initialize! :action_controller, :action_view, :sprockets

use Rack::LiveReload
run Combustion::Application
