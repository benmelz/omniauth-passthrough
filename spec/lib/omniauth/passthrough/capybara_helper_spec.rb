# frozen_string_literal: true

require "omniauth/passthrough/capybara_helper"

RSpec.describe OmniAuth::Passthrough::CapybaraHelper do
  include described_class

  describe "#omniauth_passthrough", :capybara do
    subject(:call) { omniauth_passthrough(uid: "123-uid", info: { email: "person@test.com" }) }

    before { visit "/session" }

    it "sends you back to where you started" do
      call
      expect(page).to have_current_path("/session")
    end

    it "authenticates with the omniauth passthrough strategy" do
      call
      expect([page.find_by_id("uid").text, page.find_by_id("email").text]).to eq(%w[123-uid person@test.com])
    end
  end
end
