class RemoveUniqueConstraintOnURLResponses < ActiveRecord::Migration
  def change
    remove_index :tasuku_taskables_url_responses, name: 'tasuku_taskable_url_responses_author', column: [:author_id, :author_type], unique: true
    add_index :tasuku_taskables_url_responses, ['author_id', 'author_type'], name: 'tasuku_taskable_url_responses_author'
  end
end
