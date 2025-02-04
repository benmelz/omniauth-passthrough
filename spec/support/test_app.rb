# frozen_string_literal: true

require "json"
require "omniauth/strategies/passthrough"
require "rack/protection"
require "rack/session"
require "sinatra"

class TestApp < Sinatra::Base
  use Rack::Session::Cookie, secret: "test" * 16
  use Rack::Protection
  use OmniAuth::Strategies::Passthrough

  configure do
    set :environment, :test
  end

  get "/" do
    200
  end

  get "/auth/passthrough/callback" do
    content_type :json
    auth = request.env["omniauth.auth"].to_h
                  .transform_values { |value| value.respond_to?(:to_h) ? value.to_h : value }
    { auth:, params: }.to_json
  end
end
