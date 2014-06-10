class Tasuku::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  desc 'Install the default configurations for Tasuku'

  def copy_initializer
    template 'tasuku.rb', 'config/initializers/tasuku.rb'
  end

  def add_route
    route "mount Tasuku::Engine, at: '/tasks'"
  end

  def add_helpers
    inject_into_file 'app/controllers/application_controller.rb',
                     "\n  helper Tasuku::Engine.helpers",
                     after: 'protect_from_forgery with: :exception'
  end

  def copy_migrations
    rake 'tasuku:install:migrations'
  end
end
