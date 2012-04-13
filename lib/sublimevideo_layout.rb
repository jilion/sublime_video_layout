require 'rails'
require 'jquery-rails'
require 'haml'

module SublimevideoLayout
  class Engine < ::Rails::Engine

    initializer 'assets' do |app|
      app.config.assets.precompile += %w[sublimevideo.css sublimevideo.js ie.css]
    end
    initializer 'helpers' do |app|
      ActionView::Base.send :include, SublimeVideoLayoutHelper
    end
  end
end
