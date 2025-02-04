# frozen_string_literal: true

require "builder"

module OmniAuth
  module Passthrough
    class CapybaraMiddleware
      def initialize(app)
        @app = app
      end

      def call(env)
        request = Rack::Request.new(env)
        return @app.call(env) if request.path != "/omniauth_passthrough_capybara"

        render do |xml|
          xml.form(action: "/auth/passthrough?#{request.query_string}", method: "post") do |form|
            form.input(type: "submit", value: "Submit")
          end
        end
      end

      private

      def render(&block)
        builder = ::Builder::XmlMarkup.new
        builder.html { |xml| xml.body(&block) }
        [200, { "Content-Type" => "text/html" }, [builder.target!]]
      end
    end
  end
end
