module Tasuku
  module Concerns::Illustratable
    extend ActiveSupport::Concern

    included do
      include Embeddable

      mount_uploader :image, ImageUploader
      embeddable :video, from: :video_url
    end
  end
end
