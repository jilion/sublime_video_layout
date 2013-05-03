require 'rails'
require 'jquery-rails'
require 'haml'

module SublimeVideoLayout
  class Engine < ::Rails::Engine
    initializer 'assets' do |app|
      # Should be duplicated to application when initialize_on_precompile is false
      app.config.assets.precompile += %w[errors.css ie.css]
    end
    initializer 'static assets' do |app|
      app.middleware.insert_before ::Rack::Runtime, ::ActionDispatch::Static, "#{root}/public"
    end
    initializer 'helpers' do |app|
      ActionView::Base.send :include, SublimeVideoLayout::EngineHelper
    end
  end
end
