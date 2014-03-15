class CreateTasksTaskablesVerificationConfirmations < ActiveRecord::Migration
  def change
    create_table :tasks_taskables_verification_confirmations do |t|
      t.references :verification, index: true
      t.references :author, polymorphic: true, index: true

      t.timestamps
    end
  end
end
