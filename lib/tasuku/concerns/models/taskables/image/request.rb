module Tasuku
  module Concerns::Models::Taskables::Image::Request
    extend ActiveSupport::Concern

    included do
      include ::Tasks::Taskables::Taskable
      include ::Tasks::Concerns::Illustratable

      has_many :responses

      responses are: :responses

      def to_s
        text
      end
    end
  end
end
