require 'rails'
require 'jquery-rails'
require 'slim'
require 'bourbon'

module SublimeVideoLayout
  class Engine < ::Rails::Engine
    initializer 'static assets' do |app|
      app.middleware.insert_before ::Rack::Runtime, ::ActionDispatch::Static, "#{root}/public"
    end
    initializer 'helpers' do |app|
      ActionView::Base.send :include, SublimeVideoLayout::EngineHelper
    end
  end
end
