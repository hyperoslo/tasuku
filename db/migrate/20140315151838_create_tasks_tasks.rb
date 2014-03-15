class CreateTasksTasks < ActiveRecord::Migration
  def change
    create_table :tasks_tasks do |t|
      t.references :taskable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
