module Rack
  class Maintenance
    def initialize(app, options={})
      @app = app
      @domain = options[:domain]
    end

    def call(env)
      case env["PATH_INFO"]
      when '/maintenance'
        env["MAINTENANCE"] = true
        @app.call(env)
      when "/private/#{ENV['MAINTENANCE_CODE']}"
        headers = {}
        Rack::Utils.set_cookie_header!(headers, :maintenance, {
          value: ENV['MAINTENANCE_CODE'],
          expires: 1.week.from_now,
          path: '/',
          domain: ".#{@domain}"
        })
        [302, headers.merge('Location' => '/'), ['Redirected to /']]
      else
        request = ActionDispatch::Request.new(env)
        if request.cookie_jar[:maintenance] == ENV['MAINTENANCE_CODE']
          @app.call(env)
        else
          [302, {'Location' => '/maintenance'}, ['Redirected to /maintenance']]
        end
      end
    end
  end
end
