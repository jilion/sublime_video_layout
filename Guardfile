# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'rspec', version: 2, bundler: false do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }

  # Rails example
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.*)(\.erb|\.haml)$})                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  # Capybara request specs
  watch(%r{^app/views/(.+)/.*\.(erb|haml)$})          { |m| "spec/integration/#{m[1]}_spec.rb" }
end

guard 'pow' do
  watch('.powrc')
  watch('.powenv')
  watch('.rvmrc')
  watch('config.ru')
  watch('Gemfile')
  watch('Gemfile.lock')
  # watch('config/application.rb')

  watch(%r{app/views/.+})
  watch(%r{app/helpers/.+})
  watch(%r{spec/internal/app/.+})
end

guard 'livereload', host: 'sublimevideo-layout.dev' do
  watch(%r{(app|spec/internal/app)/views/.+\.(erb|haml|slim)})
  watch(%r{(app|spec/internal/app)/helpers/.+\.rb})
  watch(%r{spec/internal/public/.+\.(css|js|html)})
  # Rails Assets Pipeline
  watch(%r{(app|vendor)/assets/\w+/(.+\.(css|js|html)).*})  { |m| "/assets/#{m[2]}" }
end

