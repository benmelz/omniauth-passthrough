# frozen_string_literal: true

require "rack/test"
require_relative "authenticity_token_helper"
require_relative "be_a_passthrough_callback_with_matcher"
require_relative "test_app"

module ActionDispatchHelper
  include Rack::Test::Methods

  alias rack_post post
  def post(url, params: {}) = rack_post url, params

  def self.included(example)
    example.include AuthenticityTokenHelper
    example.include BeAPassthroughCallbackWithMatcher
    example.let(:app) { TestApp }
  end
end
