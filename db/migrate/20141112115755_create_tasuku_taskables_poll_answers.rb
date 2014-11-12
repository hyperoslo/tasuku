class CreateTasukuTaskablesPollAnswers < ActiveRecord::Migration
  def change
    create_table :tasuku_taskables_poll_answers do |t|
      t.integer  :author_id
      t.string   :author_type
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
