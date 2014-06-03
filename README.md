# Tasuku

[![Gem Version](https://img.shields.io/gem/v/tasuku.svg)](https://rubygems.org/gems/tasuku)
[![Build Status](https://img.shields.io/travis/hyperoslo/tasuku.svg)](https://travis-ci.org/hyperoslo/tasuku)
[![Dependency Status](https://img.shields.io/gemnasium/hyperoslo/tasuku.svg)](https://gemnasium.com/hyperoslo/tasuku)
[![Code Climate](https://img.shields.io/codeclimate/github/hyperoslo/tasuku.svg)](https://codeclimate.com/github/hyperoslo/tasuku)
[![Coverage Status](https://img.shields.io/coveralls/hyperoslo/tasuku.svg)](https://coveralls.io/r/hyperoslo/tasuku)

## Installation

Add this line to your application's Gemfile:

    gem 'tasuku'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tasuku

Install the gem:

    $ rails generate tasks:install

Run the migrations:

    $ rake db:migrate

Then you can change the default configurations:

```ruby
# config/routes.rb
Rails.application.routes.draw do
  mount Tasks::Engine, at: '/tasks'
end
```

And the method to use in deriving the current user:

```ruby
# config/initializers/tasks.rb
Tasks.configure do |config|
  config.author = :current_user
end
```

### Views

Tasuku ships with views, but you can copy them to customize things to your liking:

```
$ rails generate tasks:views
```

## Usage

...

## Configuration

...

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credits

Hyper made this. We're a digital communications agency with a passion for good code,
and if you're using this library we probably want to hire you.

## License

Tasks is available under the MIT license. See the LICENSE file for more info.
