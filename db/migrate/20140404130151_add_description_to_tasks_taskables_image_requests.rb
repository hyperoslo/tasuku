class AddDescriptionToTasksTaskablesImageRequests < ActiveRecord::Migration
  def change
    add_column :tasks_taskables_image_requests, :description, :text
  end
end
