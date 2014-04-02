module Tasks
  module Taskables
    class Image::Response < ActiveRecord::Base
      include Taskable::Submission

      mount_uploader :image, ImageUploader

      belongs_to :request
      belongs_to :author, polymorphic: true

      validates :author_id, :author_type, presence: true

      request is: :request
    end
  end
end
