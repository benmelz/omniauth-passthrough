# frozen_string_literal: true

require "omniauth/passthrough/capybara_middleware"

RSpec.describe OmniAuth::Passthrough::CapybaraMiddleware, :capybara do
  let(:query_string) { "some=set&of=query&string=values" }

  before { visit "/omniauth_passthrough_capybara?#{query_string}" }

  it "renders a form that forwards query string params to the passthrough endpoint" do
    form = page.find("form")
    expect([form[:method], form[:action]]).to eq(%W[post /auth/passthrough?#{query_string}])
  end

  it "renders a submit button for the form" do
    within "form" do
      expect(page).to have_css("input[type=\"submit\"][value=\"Submit\"]")
    end
  end
end
