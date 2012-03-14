$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sublimevideo_layout/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sublimevideo_layout"
  s.version     = SublimevideoLayout::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of SublimevideoLayout."
  s.description = "TODO: Description of SublimevideoLayout."

  s.files = Dir["{app,config,db,lib,vendor}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.0"
  s.add_dependency "coffee-rails", "~> 3.2.0"
  s.add_dependency "prototype-rails", "~> 3.2.0"
  s.add_dependency "modernizr", "~> 2.5.3"
  s.add_dependency "haml"

  s.add_development_dependency "sqlite3"
end
