# frozen_string_literal: true

require "json"
require "omniauth/passthrough"
require "rack/protection"
require "rack/session"
require "rack/test"
require "sinatra"

ENV["RACK_ENV"] = "test"

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

module SinatraHelper
  include Rack::Test::Methods

  def self.included(example)
    example.let(:app) { TestApp }
    example.before do
      get "/"
      env "HTTP_X_CSRF_TOKEN", last_request.session[:csrf]
    end
  end
end

RSpec.configure do |config|
  config.include SinatraHelper
end
