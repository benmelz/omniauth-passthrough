# frozen_string_literal: true

require "capybara"
require "capybara/dsl"

module CapybaraHelper
  include Capybara::DSL

  def self.included(example)
    example.before { Capybara.app = TestApp }
  end
end
