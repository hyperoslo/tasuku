module Tasks
  module Concerns::Models::Taskables::Question
    extend ActiveSupport::Concern

    included do
      include ::Tasks::Taskables::Taskable

      has_many :options
      has_many :answers, through: :options

      accepts_nested_attributes_for :options, allow_destroy: true

      responses are: :answers

      def to_s
        text
      end
    end
  end
end
