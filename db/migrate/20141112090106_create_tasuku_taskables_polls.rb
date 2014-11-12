class CreateTasukuTaskablesPolls < ActiveRecord::Migration
  def change
    create_table :tasuku_taskables_polls do |t|
      t.text     :text
      t.datetime :created_at
      t.datetime :updated_at
      t.text     :description
      t.boolean  :multiple
      t.boolean  :show_statistics, default: true
      t.string   :image
      t.string   :video_url
    end
  end
end
