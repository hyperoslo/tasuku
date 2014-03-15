class CreateTasksTaskablesVerifications < ActiveRecord::Migration
  def change
    create_table :tasks_taskables_verifications do |t|
      t.references :verifiable, polymorphic: true

      t.timestamps
    end

    add_index :tasks_taskables_verifications, [:verifiable_id, :verifiable_type], unique: true, name: 'index_tasks_taskable_verifications_verifiable'
  end
end
