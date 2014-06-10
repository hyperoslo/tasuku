module Tasuku
  module Concerns::Models::Taskables::Question
    extend ActiveSupport::Concern

    included do
      include ::Tasks::Taskables::Taskable
      include ::Tasks::Concerns::Illustratable

      has_many :options
      has_many :votes, through: :options

      accepts_nested_attributes_for :options, allow_destroy: true

      def answers
        Taskables::Question::Answer.joins(:votes).where(
          Taskables::Question::Vote.table_name => { option_id: options.pluck(:id) }
        ).uniq
      end

      def single?
        !multiple?
      end

      def to_s
        text
      end

      responses are: :answers
    end
  end
end
