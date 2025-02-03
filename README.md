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

TODO: Write usage instructions here

## Development

* Run `bin/setup` to install dependencies.
* Run `bin/rake appraisal spec` to run the tests.
* Run `bin/rake rubocop` to run the linter.
* Run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/omniauth-passthrough.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
