# frozen_string_literal: true

module OmniAuth
  module Passthrough
    module CapybaraHelper
      def omniauth_passthrough(params = {})
        original_url = current_url
        visit "/auth/passthrough/callback?#{Rack::Utils.build_nested_query(params)}"
        visit original_url if current_url != original_url
      end
    end
  end
end
