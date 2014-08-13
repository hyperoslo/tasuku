class CreateTasukuTaskablesCodeRequests < ActiveRecord::Migration
  def change
    create_table :tasuku_taskables_code_requests do |t|
      t.string :text
      t.string :code

      t.timestamps
    end
  end
end
