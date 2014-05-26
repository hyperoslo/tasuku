require 'spec_helper'
require 'generator_spec'
require 'generators/tasuku/install/install_generator'

describe 'rails g tasuku:install', wip: true do
  destination File.expand_path('../../../../tmp', __FILE__)
  tests Tasuku::InstallGenerator

  before(:each) do
    prepare_destination
    run_generator
  end

  it 'adds the initializer to the project' do
    assert_file 'config/initializers/tasuku.rb'
  end

  it 'copies the migration files' do
    assert_file 'db/migrate/20140315151838_create_tasks_tasks.rb'
    assert_file 'db/migrate/20140512120632_create_tasks_taskables_question_votes.rb'
  end
end
