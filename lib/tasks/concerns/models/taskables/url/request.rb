module Tasks
  module Concerns::Models::Taskables::URL::Request
    extend ActiveSupport::Concern

    included do
      include ::Tasks::Taskables::Taskable

      has_many :responses, dependent: :destroy

      responses are: :responses

      def to_s
        text
      end
    end
  end
end
