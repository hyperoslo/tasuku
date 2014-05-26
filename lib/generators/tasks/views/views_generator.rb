class Tasks::ViewsGenerator < Rails::Generators::Base
  source_root File.expand_path('../../../../../', __FILE__)

  desc 'Copies the tasks view files'

  def copy_view_files
    directory 'app/views/tasks'
  end
end