class AddImages < ActiveRecord::Migration
  def change
    add_column :tasks_taskables_questions, :image, :string
    add_column :tasks_taskables_image_requests, :image, :string
    add_column :tasks_taskables_url_requests, :image, :string
    add_column :tasks_taskables_text_requests, :image, :string
  end
end
