source "http://rubygems.org"

gem 'bundler'

# Declare your gem's dependencies in sublimevideo_layout.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# jquery-rails is used by the dummy application
# gem "jquery-rails"

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :development do
  gem 'combustion', '~> 0.3.1'
  gem 'haml-rails'
  gem 'rack-livereload'
end

group :test do
  gem 'rspec-rails'
  gem 'capybara'
end

group :tools do
  gem 'gemfury'

  gem 'growl'
  platforms :ruby do
    gem 'rb-readline'
  end

  gem 'guard-pow'
  gem 'guard-livereload'
  gem 'guard-rspec'
end