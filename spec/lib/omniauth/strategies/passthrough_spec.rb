# frozen_string_literal: true

require "omniauth/strategies/passthrough"

RSpec.describe OmniAuth::Strategies::Passthrough, :rack do
  subject(:submit) do
    post "/auth/passthrough", params
    follow_redirect!
  end

  let(:auth) { last_request.env["omniauth.auth"] }

  context "without auth params" do
    let(:params) { {} }

    it "authenticates with no values" do
      submit
      expect(last_request).to be_a_passthrough_callback_with(params)
    end
  end

  context "with auth params" do
    let(:params) do
      { "uid" => "123-uid",
        "info" => { "whatever" => "you" },
        "credentials" => { "want" => "gets" },
        "extra" => { "passed" => "through" },
        "even" => "flat params" }
    end

    it "authenticates with the given values" do
      submit
      expect(last_request).to be_a_passthrough_callback_with(params)
    end
  end
end
