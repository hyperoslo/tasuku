module Tasks
  class Engine < ::Rails::Engine
    isolate_namespace Tasks

    initializer 'tasks.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper Tasks::ApplicationHelper
        helper Tasks::Taskables::VerificationsHelper
      end
    end

    initializer 'tasks.factories', after: 'factory_girl.set_factory_paths' do
      FactoryGirl.definition_file_paths << File.expand_path('../../../spec/factories', __FILE__) if defined?(FactoryGirl)
    end

    config.generators do |g|
      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.assets false
      g.helper false
    end
  end
end
