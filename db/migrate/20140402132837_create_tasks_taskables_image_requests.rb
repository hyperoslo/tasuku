class CreateTasksTaskablesImageRequests < ActiveRecord::Migration
  def change
    create_table :tasks_taskables_image_requests do |t|
      t.text :text

      t.timestamps
    end
  end
end
