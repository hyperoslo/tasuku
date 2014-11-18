class CreateTasukuTaskablesPollVotes < ActiveRecord::Migration
  def change
    create_table :tasuku_taskables_poll_votes do |t|
      t.integer  :answer_id
      t.integer  :option_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
