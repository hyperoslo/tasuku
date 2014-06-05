class CreateTasksTaskablesTaskableResponses < ActiveRecord::Migration
  def change
    create_table :tasks_taskables_taskable_responses do |t|
      t.references :submittable, polymorphic: true
      t.references :author, polymorphic: true

      t.timestamps
    end
  end
end
