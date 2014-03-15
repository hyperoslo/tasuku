class CreateTasksTaskablesVerificationConfirmations < ActiveRecord::Migration
  def change
    create_table :tasks_taskables_verification_confirmations do |t|
      t.references :verification
      t.references :author, polymorphic: true

      t.timestamps
    end

    add_index :tasks_taskables_verification_confirmations, [:verification_id], name: 'tasks_taskable_verification_confirmation_verification'
    add_index :tasks_taskables_verification_confirmations, [:author_id, :author_type], unique: true, name: 'tasks_taskable_verification_confirmation_author'
  end
end
