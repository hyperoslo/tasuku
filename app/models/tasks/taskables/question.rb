module Tasks
  module Taskables
    class Question < ActiveRecord::Base
      include Taskable

      has_one :task, as: :taskable, dependent: :destroy
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
