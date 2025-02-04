# frozen_string_literal: true

require "sinatra_helper"
require "omniauth/passthrough/rack_helper"

RSpec.describe OmniAuth::Passthrough::RackHelper do
  include described_class

  describe "#omniauth_passthrough" do
    subject(:call) { omniauth_passthrough(params) }

    let(:params) do
      { "uid" => "123-uid",
        "info" => { "whatever" => "you" },
        "credentials" => { "want" => "gets" },
        "extra" => { "passed" => "through" },
        "even" => "flat params" }
    end

    it "authenticates with the omniauth passthrough strategy" do
      call
      expect(JSON.parse(last_response.body)).to eq({ "auth" => params.except("even").merge("provider" => "passthrough"),
                                                     "params" => params })
    end
  end
end
