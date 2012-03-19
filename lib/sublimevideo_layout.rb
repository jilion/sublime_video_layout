require 'haml'
require 'prototype-rails'

module SublimevideoLayout
  class Engine < ::Rails::Engine
    config.to_prepare do
      # ApplicationController.layout 'sublimevideo'
    end
    initializer "static assets" do |app|
      app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
    end
  end
end
