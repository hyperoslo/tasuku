class AddReplyToOption < ActiveRecord::Migration
  def change
    add_column :tasuku_taskables_question_options, :reply, :text
  end
end
