class CreateTasukuTaskablesCodeResponses < ActiveRecord::Migration
  def change
    create_table :tasuku_taskables_code_responses do |t|
      t.string :code
      t.references :request
      t.references :author, polymorphic: true

      t.timestamps
    end
  end
end
