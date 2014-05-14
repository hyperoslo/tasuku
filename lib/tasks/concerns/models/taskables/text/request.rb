module Tasks
  module Concerns::Models::Taskables::Text::Request
    extend ActiveSupport::Concern

    included do
      include ::Tasks::Taskables::Taskable

      has_many :responses

      responses are: :responses

      def to_s
        text
      end
    end
  end
end
