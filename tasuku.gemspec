$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'tasuku/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'tasuku'
  s.version     = Tasuku::VERSION
  s.authors     = ['Johannes Gorset']
  s.email       = ['johannes@hyper.no']
  s.homepage    = 'http://github.com/hyperoslo/tasuku'
  s.summary     = 'Easily set up custom solvable tasks in your Rails app'
  s.description = 'Easily set up custom solvable tasks in your Ruby on Rails app.'
  s.license     = 'MIT'

  s.files      = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'rails', '~> 4.0'
  s.add_dependency 'configatron', '~> 3.0'
  s.add_dependency 'carrierwave', '~> 0.10'
  s.add_dependency 'mini_magick', '~> 3.7'
  s.add_dependency 'embeddable', '~> 0.0.8'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails', '2.14'
  s.add_development_dependency 'coveralls'
  s.add_development_dependency 'faker'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'generator_spec'
  s.add_development_dependency "guard"
  s.add_development_dependency "guard-rspec"
end
