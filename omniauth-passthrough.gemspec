# frozen_string_literal: true

require_relative "lib/omniauth/passthrough/version"

Gem::Specification.new do |spec|
  spec.name = "omniauth-passthrough"
  spec.summary = "An OmniAuth strategy that passes request params straight through the middleware."
  spec.description = <<~DESCRIPTION.tr("\n", " ")
    This strategy allows you to pass auth hash values directly to an auth endpoint and forwards them directly to your
    callback(s). The end goal of this is to provide more flexibility when writing login helpers in development/test
    environments while still utilizing your OmniAuth callback(s).
  DESCRIPTION
  spec.license = "MIT"
  spec.author = "Benjamin Melz"
  spec.email = "ben@melz.me"
  spec.homepage = "https://github.com/benmelz/omniauth-passthrough"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/v#{OmniAuth::Passthrough::VERSION}/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir["lib/**/*", "CHANGELOG.md", "README.md", "LICENSE.md"]
  spec.require_path = "lib"

  spec.version = OmniAuth::Passthrough::VERSION
  spec.required_ruby_version = ">= 3.2"
  spec.add_dependency "omniauth", ">= 2.1.1", "< 3"
  spec.add_dependency "rack", ">= 2.2.3", "< 4"
end
