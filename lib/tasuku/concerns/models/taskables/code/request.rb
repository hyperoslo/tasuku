module Tasuku
  module Concerns::Models::Taskables::Code::Request
    extend ActiveSupport::Concern

    included do
      include ::Tasks::Taskables::Taskable

      has_many :responses

      validates :text, :code, presence: true

      responses are: :responses

      def to_s
        text
      end
    end
  end
end
