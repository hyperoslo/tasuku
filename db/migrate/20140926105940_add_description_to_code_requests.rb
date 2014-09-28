class AddDescriptionToCodeRequests < ActiveRecord::Migration
  def change
    add_column :tasuku_taskables_code_requests, :description, :text
  end
end
