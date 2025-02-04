# frozen_string_literal: true

module OmniAuth
  module Passthrough
    module RackHelper
      def omniauth_passthrough(params = {})
        post("/auth/passthrough", params)
        follow_redirect!
      end
    end
  end
end
