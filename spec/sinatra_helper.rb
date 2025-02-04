# frozen_string_literal: true

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

  get "/auth/passthrough/callback" do
    200
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
