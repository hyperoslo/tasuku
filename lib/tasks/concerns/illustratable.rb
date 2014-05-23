module Tasks
  module Concerns::Illustratable
    extend ActiveSupport::Concern

    included do
      mount_uploader :image, ImageUploader
    end
  end
end
