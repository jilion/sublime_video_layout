require 'rails'
require 'jquery-rails'
require 'slim'
require 'bourbon'
require 'noie'

module SublimeVideoLayout
  class Engine < ::Rails::Engine
    initializer 'static assets' do |app|
      app.middleware.insert_before ::Rack::Runtime, ::ActionDispatch::Static, "#{root}/public"
    end
    initializer 'no ie' do |app|
      app.middleware.use Rack::NoIE, redirect: 'http://browsehappy.com', minimum: 10
    end
    initializer 'helpers' do |app|
      ActionView::Base.send :include, SublimeVideoLayout::EngineHelper
    end
  end
end
