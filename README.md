# omniauth-passthrough

An OmniAuth strategy that passes request params straight through the middleware.

This strategy allows you to pass auth hash values directly to an auth endpoint and forwards them directly to your
callback(s). The end goal of this is to provide more flexibility when writing login helpers in development/test
environments while still utilizing your OmniAuth callback(s).

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add omniauth-passthrough
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install omniauth-passthrough
```

## Usage

Include the passthrough strategy in development/test environments as you would with any other OmniAuth
strategy. *NEVER* use it in a production environment.

Once included, any POST request to `/auth/passthrough` will pass through any `uid`, `info`, `credentials` and `extra`
params to your omniauth callback.

```ruby 
# request
post '/auth/passthrough', params: { uid: 'my-uid',
                                    info: { email: 'my-email@example.com', first_name: 'My', last_name: 'Name' } }

# callback
request.env['omniauth.auth'].uid # => 'my-uid'
request.env['omniauth.auth'].info.email # => 'my-email@example.com'
request.env['omniauth.auth'].info.first_name # => 'My'
request.env['omniauth.auth'].info.last_name # => 'Name'
```

### Test Environments

A number of test helpers are provided to help with using the strategy for test login helpers.

```ruby
# including one of the following helpers in your test
include Omniauth::Passthrough::RackHelper # Rack::Test

# will make the following login helper available
omniauth_passthrough(uid: 'my-uid', info: { email: 'my-email@example.com', first_name: 'My', last_name: 'Name' })
```

## Development

* Run `bin/setup` to install dependencies.
* Run `bin/rake appraisal spec` to run the tests.
* Run `bin/rake rubocop` to run the linter.
* Run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/omniauth-passthrough.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
