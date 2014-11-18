class CreateTasukuTaskablesPollOptions < ActiveRecord::Migration
  def change
    create_table :tasuku_taskables_poll_options do |t|
      t.text     :text
      t.integer  :poll_id
      t.datetime :created_at
      t.datetime :updated_at
      t.text     :reply
    end
  end
end
