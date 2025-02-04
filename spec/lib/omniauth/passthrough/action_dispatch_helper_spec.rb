# frozen_string_literal: true

require "json"
require "omniauth/passthrough/action_dispatch_helper"

RSpec.describe OmniAuth::Passthrough::ActionDispatchHelper do
  include described_class

  describe "#omniauth_passthrough", :action_dispatch do
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
      expect(last_request).to be_a_passthrough_callback_with(params)
    end
  end
end
