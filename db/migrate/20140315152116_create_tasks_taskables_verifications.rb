class CreateTasksTaskablesVerifications < ActiveRecord::Migration
  def change
    create_table :tasks_taskables_verifications do |t|
      t.references :verifiable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
