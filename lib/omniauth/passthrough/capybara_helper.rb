# frozen_string_literal: true

module OmniAuth
  module Passthrough
    module CapybaraHelper
      def omniauth_passthrough(params = {})
        original_url = current_url
        visit "/omniauth_passthrough_capybara?#{Rack::Utils.build_nested_query(params)}"
        click_on "Authenticate"
        visit original_url
      end
    end
  end
end
