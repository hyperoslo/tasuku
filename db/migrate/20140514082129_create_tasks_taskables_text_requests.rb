class CreateTasksTaskablesTextRequests < ActiveRecord::Migration
  def change
    create_table :tasks_taskables_text_requests do |t|
      t.text :text
      t.text :description

      t.timestamps
    end
  end
end
