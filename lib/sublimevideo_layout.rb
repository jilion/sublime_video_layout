require 'rails'
require 'jquery-rails'
require 'haml'

module SublimevideoLayout
  class Engine < ::Rails::Engine
    initializer 'assets' do |app|
      app.config.assets.precompile += %w[sublimevideo.css sublimevideo.js ie.css]
    end
    initializer 'static assets' do |app|
      app.middleware.insert_before Rack::Lock, ::ActionDispatch::Static, "#{root}/public"
    end
    initializer 'controllers' do |app|
      if Rails.env == 'test' || !Rails.application.config.consider_all_requests_local
        require 'sublimevideo_layout/error_handler'
        ActionController::Base.send :include, SublimevideoLayout::ErrorHandler
      end
    end
    # initializer 'helpers' do |app|
    #   ActionView::Base.send :include, SublimeVideoLayoutHelper
    # end
  end
end
