# frozen_string_literal: true

module BeAPassthroughCallbackWithMatcher
  extend RSpec::Matchers::DSL

  matcher :be_a_passthrough_callback_with do |params|
    match do |request|
      request.request_method == "GET" &&
        request.path == "/auth/passthrough/callback" &&
        request.params == params &&
        request.env["omniauth.auth"].provider == "passthrough" &&
        auth_values_passed_through?(request.env["omniauth.auth"], params)
    end

    def auth_values_passed_through?(auth, params)
      auth.uid == params["uid"] &&
        auth.info == (params["info"] || {}) &&
        auth.credentials == (params["credentials"] || {}) &&
        auth.extra == (params["extra"] || {})
    end
  end
end
