# frozen_string_literal: true

module OmniAuth
  module Passthrough
    module ActionDispatchHelper
      def omniauth_passthrough(params = {})
        get("/auth/passthrough/callback", params:)
      end
    end
  end
end
