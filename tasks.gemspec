$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tasks/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tasks"
  s.version     = Tasks::VERSION
  s.authors     = ["Johannes Gorset"]
  s.email       = ["johannes@hyper.no"]
  s.homepage    = "http://github.com/hyperoslo/tasks"
  s.summary     = "Easily set up custom solvable tasks in your Rails app"
  s.description = "Easily set up custom solvable tasks in your Ruby on Rails app."
  s.license     = "MIT"

  s.files      = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.0"
  s.add_dependency "configatron", "~> 3.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "faker"
  s.add_development_dependency "capybara"
  s.add_development_dependency "factory_girl_rails"
end
