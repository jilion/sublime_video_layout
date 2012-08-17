source 'https://rubygems.org'

gem 'bundler'
gem 'rake'

gemspec

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
    gem 'coolline'
  end

  gem 'guard-pow'
  gem 'guard-livereload'
  gem 'guard-rspec'
end
