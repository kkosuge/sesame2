# Sesame2

This gem is a simple library for using the Sesame Web API to unlock and lock SESAME 3 and SESAME 4.
https://doc.candyhouse.co/ja/SesameAPI

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sesame2'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install sesame2

## Usage

```ruby
client = Sesame2::Client.new(
  api_key: "Get from the CANDYHOUSE Dashboard"
)

sesame = client.sesame(
  sesame2_uuid: "Get from your Sesame App",
  key_secret_hex: "Good luck getting it from your Sesame App"
)

p sesame.status
p sesame.toggle(history: 'test')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kkosuge/sesame2. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/kkosuge/sesame2/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Sesame2 project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/kkosuge/sesame2/blob/master/CODE_OF_CONDUCT.md).
