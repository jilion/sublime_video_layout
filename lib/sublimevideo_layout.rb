require 'rails'
require 'jquery-rails'
require 'haml'

module SublimevideoLayout
  class Engine < ::Rails::Engine
    initializer 'assets' do |app|
      app.config.assets.precompile += %w[errors.css ie.css sublimevideo.css sublimevideo.js]
    end
    initializer 'static assets' do |app|
      app.middleware.insert_before Rack::Lock, ::ActionDispatch::Static, "#{root}/public"
    end
    initializer 'helpers' do |app|
      ActionView::Base.send :include, SublimevideoLayout::EngineHelper
    end
  end
end
