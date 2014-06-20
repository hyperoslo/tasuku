module Tasuku
  module Concerns::Models::Taskables::Text::Request
    extend ActiveSupport::Concern

    included do
      include ::Tasks::Taskables::Taskable
      include ::Tasks::Concerns::Illustratable

      has_many :responses, dependent: :destroy

      validates_presence_of :text

      responses are: :responses

      def to_s
        text
      end
    end
  end
end
