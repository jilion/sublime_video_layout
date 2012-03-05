module SublimevideoLayout
  class Engine < ::Rails::Engine
    config.to_prepare do
      ApplicationController.layout 'sublimevideo'
    end
  end
end
