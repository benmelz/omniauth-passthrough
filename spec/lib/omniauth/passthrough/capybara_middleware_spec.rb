# frozen_string_literal: true

require "omniauth/passthrough/capybara_middleware"

RSpec.describe OmniAuth::Passthrough::CapybaraMiddleware, :capybara do
  let(:query_string) { "some=set&of=query&string=values" }

  before { visit "/omniauth_passthrough_capybara?#{query_string}" }

  it "renders an authentication link" do
    expect(page).to have_link("Authenticate", href: "/auth/passthrough/callback?#{query_string}")
  end
end
