# frozen_string_literal: true

require "rack/test"
require_relative "authenticity_token_helper"
require_relative "be_a_passthrough_callback_with_matcher"
require_relative "test_app"

module RackHelper
  include Rack::Test::Methods

  def self.included(example)
    example.include AuthenticityTokenHelper
    example.include BeAPassthroughCallbackWithMatcher
    example.let(:app) { TestApp }
  end
end
