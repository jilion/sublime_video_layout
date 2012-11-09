$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sublime_video_layout/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sublime_video_layout"
  s.version     = SublimeVideoLayout::VERSION
  s.authors     = ["Jilion"]
  s.email       = ["info@jilion.com"]
  s.homepage    = "http://jilion.com"
  s.summary     = "Layout for all SublimeVideo applications."
  s.description = "Layout for all SublimeVideo applications."

  s.files = Dir["{app,config,db,lib,public,vendor/assets}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 3.2.0"
  s.add_dependency "jquery-rails", "~> 2.1.0"
  s.add_dependency "coffee-rails", "~> 3.2.0"
  s.add_dependency "haml"
end
