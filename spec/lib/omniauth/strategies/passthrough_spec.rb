# frozen_string_literal: true

require "omniauth/strategies/passthrough"

RSpec.describe OmniAuth::Strategies::Passthrough do
  describe "POSTing to the callback endpoint", :rack do
    subject(:authenticate) do
      post "/auth/passthrough", params
      follow_redirect!
    end

    let(:auth) { last_request.env["omniauth.auth"] }

    context "without auth params" do
      let(:params) { {} }

      it "sets an omniauth env with a nil uid" do
        authenticate
        expect(auth.uid).to be_nil
      end

      it "sets an omniauth env with an empty info hash" do
        authenticate
        expect(auth.info).to eq({})
      end

      it "sets an omniauth env with an empty credentials hash" do
        authenticate
        expect(auth.credentials).to eq({})
      end

      it "sets an omniauth env with an empty extra hash" do
        authenticate
        expect(auth.extra).to eq({})
      end
    end

    context "with auth params" do
      let(:params) do
        { "uid" => "123-uid",
          "info" => { "whatever" => "you" },
          "credentials" => { "want" => "gets" },
          "extra" => { "passed" => "through" } }
      end

      it "forwards all params" do
        authenticate
        expect(last_request.params).to eq(params)
      end

      it "sets an omniauth env with the provided uid" do
        authenticate
        expect(auth.uid).to eq(params["uid"])
      end

      it "sets an omniauth env with the provided info hash" do
        authenticate
        expect(auth.info).to eq(params["info"])
      end

      it "sets an omniauth env with the provided credentials hash" do
        authenticate
        expect(auth.credentials).to eq(params["credentials"])
      end

      it "sets an omniauth env with the provided extras hash" do
        authenticate
        expect(auth.extra).to eq(params["extra"])
      end
    end
  end
end
