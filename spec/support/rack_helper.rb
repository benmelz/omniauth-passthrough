# frozen_string_literal: true

require "rack/test"
require_relative "authenticity_token_helper"
require_relative "test_app"

module RackHelper
  include Rack::Test::Methods

  def self.included(example)
    example.include AuthenticityTokenHelper
    example.let(:app) { TestApp }
  end
end
