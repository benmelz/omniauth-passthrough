# frozen_string_literal: true

module AuthenticityTokenHelper
  def self.included(example)
    example.before do
      get "/"
      env "HTTP_X_CSRF_TOKEN", last_request.session[:csrf]
    end
  end
end
