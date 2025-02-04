# frozen_string_literal: true

require "omniauth/passthrough"

RSpec.describe OmniAuth::Passthrough do
  it "has a version number" do
    expect(OmniAuth::Passthrough::VERSION).not_to be_nil
  end
end
