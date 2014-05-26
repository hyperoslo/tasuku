module Tasuku
  module Concerns::Models::Taskables::Text::Request
    extend ActiveSupport::Concern

    included do
      include ::Tasks::Taskables::Taskable
      include ::Tasks::Concerns::Illustratable

      has_many :responses, dependent: :destroy

      responses are: :responses

      def to_s
        text
      end
    end
  end
end
