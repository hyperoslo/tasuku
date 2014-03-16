module Tasks
  class Taskables::Question < ActiveRecord::Base
    extend Taskable

    has_one :task, as: :taskable
    has_many :options
    has_many :answers, through: :options

    submissions are: :answers

    def to_s
      text
    end
  end
end
