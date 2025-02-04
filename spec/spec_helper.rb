# frozen_string_literal: true

require "simplecov"
require_relative "support/action_dispatch_helper"
require_relative "support/capybara_helper"
require_relative "support/rack_helper"

SimpleCov.start do
  add_filter %r{^/spec/}
  enable_coverage :branch
  minimum_coverage line: 100, branch: 100
end

RSpec.configure do |config|
  config.example_status_persistence_file_path = ".rspec_status"
  config.disable_monkey_patching!
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  config.include ActionDispatchHelper, :action_dispatch
  config.include CapybaraHelper, :capybara
  config.include RackHelper, :rack
end
