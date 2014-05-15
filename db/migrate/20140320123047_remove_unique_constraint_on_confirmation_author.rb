class RemoveUniqueConstraintOnConfirmationAuthor < ActiveRecord::Migration
  def up
    remove_index :tasks_taskables_verification_confirmations, name: 'tasks_taskable_verification_confirmation_author'
    add_index :tasks_taskables_verification_confirmations, ['author_id', 'author_type'], name: 'tasks_taskable_verification_confirmation_author'
  end
end
