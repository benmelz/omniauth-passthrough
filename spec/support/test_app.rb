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

  get "/session" do
    <<~HTML
      <div class="uid">#{session[:uid]}</div>
      <div class="email">#{session[:email]}</div>
    HTML
  end

  get "/auth/passthrough/callback" do
    session[:uid] = request.env["omniauth.auth"].uid
    session[:email] = request.env["omniauth.auth"].info.email
    200
  end
end
