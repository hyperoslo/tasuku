class RemoveUniqueConstraintOnImageResponseAuthor < ActiveRecord::Migration
  def up
    remove_index :tasks_taskables_image_responses, name: 'tasks_taskable_image_responses_author'
    add_index :tasks_taskables_image_responses, [:author_id, :author_type], name: 'tasks_taskable_image_responses_author'
  end
end
