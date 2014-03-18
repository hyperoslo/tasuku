module Tasks
  module Taskables
    class Question < ActiveRecord::Base
      include Taskable

      has_one :task, as: :taskable
      has_many :options
      has_many :answers, through: :options

      accepts_nested_attributes_for :options, allow_destroy: true

      submissions are: :answers

      def to_s
        text
      end
    end
  end
end
