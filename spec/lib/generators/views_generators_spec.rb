require 'spec_helper'
require 'generator_spec'
require 'generators/tasks/views/views_generator'

describe 'rails g tasks:views' do
  destination File.expand_path('../../../../tmp', __FILE__)
  tests Tasks::ViewsGenerator

  before(:each) do
    prepare_destination
    run_generator
  end

  it 'copies the view files to your project' do
    assert_file 'app/views/tasks/tasks/show.html.erb'
    assert_file 'app/views/tasks/tasks/_task.html.erb'

    assert_file 'app/views/tasks/taskables/image/requests/_request.html.erb'
    assert_file 'app/views/tasks/taskables/image/responses/create.html.erb'
    assert_file 'app/views/tasks/taskables/image/responses/_form.html.erb'
  end
end
