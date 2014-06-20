require 'spec_helper'
require 'generator_spec'
require 'generators/tasuku/views/views_generator'

describe 'rails g tasuku:views' do
  destination File.expand_path('../../../../tmp', __FILE__)
  tests Tasuku::ViewsGenerator

  before(:each) do
    prepare_destination
    run_generator
  end

  it 'copies the view files to your project' do
    assert_file 'app/views/tasuku/tasks/show.html.erb'
    assert_file 'app/views/tasuku/tasks/_task.html.erb'

    assert_file 'app/views/tasuku/taskables/image/requests/_request.html.erb'
    assert_file 'app/views/tasuku/taskables/image/responses/create.html.erb'
    assert_file 'app/views/tasuku/taskables/image/responses/_form.html.erb'
  end
end
