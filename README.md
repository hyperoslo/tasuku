![Tasuku](https://raw.githubusercontent.com/hyperoslo/tasuku/master/doc/logo.png)

[![Gem Version](https://img.shields.io/gem/v/tasuku.svg?style=flat)](https://rubygems.org/gems/tasuku)
[![Build Status](https://img.shields.io/travis/hyperoslo/tasuku.svg?style=flat)](https://travis-ci.org/hyperoslo/tasuku)
[![Dependency Status](https://img.shields.io/gemnasium/hyperoslo/tasuku.svg?style=flat)](https://gemnasium.com/hyperoslo/tasuku)
[![Code Climate](https://img.shields.io/codeclimate/github/hyperoslo/tasuku.svg?style=flat)](https://codeclimate.com/github/hyperoslo/tasuku)
[![Coverage Status](https://img.shields.io/coveralls/hyperoslo/tasuku.svg?style=flat)](https://coveralls.io/r/hyperoslo/tasuku)

Tasuku is a framework for building tasks in Ruby on Rails. It ships with an array of tasks
ranging from reading articles to sharing photos. You can make your own tasks, too,
and we'd love for you to contribute if you do.

## Usage

Really it's up to you. Tasuku just supplies a [set of models](https://github.com/hyperoslo/tasuku/tree/master/app/models/tasuku/taskables)
that may be completed in various ways and you can go about doing that however you like. We sometimes organize
tasks in a `Course` model. Other times we use [Feeder](https://github.com/hyperoslo/feeder) to mix them
with other interesting things.

![UML](https://raw.githubusercontent.com/hyperoslo/tasuku/e19d7d35e5fc1aecd86349917d4a9b387743aa67/doc/uml.png)

## Installation

Add this line to your application's Gemfile:

    gem 'tasuku'

And then execute:

    $ bundle

Install the gem:

    $ rails generate tasuku:install

Run the migrations:

    $ rake db:migrate

Then you can change the default configurations:

```ruby
# config/routes.rb
Rails.application.routes.draw do
  mount Tasuku::Engine, at: '/tasks'
end
```

And finally the method to use in deriving the model instance that
solving tasks will attributed to. Typically this is a user of some kind,
but it could also be a group of users.

If you're using [Devise](https://github.com/plataformatec/devise) for authentication,
for example, you might have a method `current_user` that returns the right instance
of your `User` model:

```ruby
# config/initializers/tasuku.rb
Tasuku.configure do |config|
  config.author = :current_user
end
```

### Views

Tasuku ships with views, but you can copy them to customize things to your liking:

```
$ rails generate tasuku:views
```

Tasuku defaults to using your application's layout, so you'll need to prefix your own route
helpers with `main_app` so Ruby on Rails knows where to look.

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

Tasuku is available under the MIT license. See the LICENSE file for more info.
