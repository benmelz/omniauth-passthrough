# frozen_string_literal: true

module OmniAuth
  module Passthrough
    class CapybaraMiddleware
      def initialize(app)
        @app = app
      end

      def call(env)
        request = Rack::Request.new(env)
        return @app.call(env) if request.path != "/omniauth_passthrough_capybara"

        [200, { "Content-Type" => "text/html" }, [<<~HTML]]
          <a href="/auth/passthrough/callback?#{request.query_string}">Authenticate</a>
        HTML
      end
    end
  end
end
