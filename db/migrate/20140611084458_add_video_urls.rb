class AddVideoUrls < ActiveRecord::Migration
  def change
    add_column :tasuku_taskables_questions, :video_url, :string
    add_column :tasuku_taskables_image_requests, :video_url, :string
    add_column :tasuku_taskables_url_requests, :video_url, :string
    add_column :tasuku_taskables_text_requests, :video_url, :string
  end
end
