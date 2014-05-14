class AddMultipleToQuestion < ActiveRecord::Migration
  def change
    add_column :tasks_taskables_questions, :multiple, :boolean
  end
end
