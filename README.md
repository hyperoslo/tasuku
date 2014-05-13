# Tasks

[![Gem Version](https://img.shields.io/gem/v/tasks.svg)](https://rubygems.org/gems/tasks)
[![Build Status](https://img.shields.io/travis/hyperoslo/tasks.svg)](https://travis-ci.org/hyperoslo/tasks)
[![Dependency Status](https://img.shields.io/gemnasium/hyperoslo/tasks.svg)](https://gemnasium.com/hyperoslo/tasks)
[![Code Climate](https://img.shields.io/codeclimate/github/hyperoslo/tasks.svg)](https://codeclimate.com/github/hyperoslo/tasks)
[![Coverage Status](https://img.shields.io/coveralls/hyperoslo/tasks.svg)](https://coveralls.io/r/hyperoslo/tasks)

## Installation

Add this line to your application's Gemfile:

    gem 'tasks'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tasks

Install the migrations:

    rake tasks:install:migrations

Run the migrations:

    rake db:migrate

Configure your routes:

```ruby
# config/routes.rb
Rails.application.routes.draw do
  [...]

  mount Tasks::Engine, at: '/tasks'
end
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
