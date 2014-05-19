class CreateTasksTaskablesURLResponses < ActiveRecord::Migration
  def change
    create_table :tasks_taskables_url_responses do |t|
      t.text :url
      t.references :request, index: true
      t.references :author, polymorphic: true

      t.timestamps
    end

    add_index :tasks_taskables_url_responses, [:author_id, :author_type], unique: true, name: 'tasks_taskable_url_responses_author'
  end
end
