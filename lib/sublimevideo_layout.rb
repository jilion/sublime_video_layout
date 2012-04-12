require 'rails'
require 'jquery-rails'
require 'haml'

module SublimevideoLayout
  class Engine < ::Rails::Engine

    initializer 'assets' do |app|
      app.config.assets.precompile += %w[sublimevideo.css sublimevideo.js ie.css]
    end
    initializer 'static assets' do |app|
      app.middleware.insert_after Rack::Lock, ::ActionDispatch::Static, "#{root}/public"
    end
    initializer 'helpers' do |app|
      ActionView::Base.send :include, SublimeVideoLayoutHelper
    end
  end
end
