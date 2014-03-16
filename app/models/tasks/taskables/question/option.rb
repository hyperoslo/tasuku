module Tasks
  class Taskables::Question::Option < ActiveRecord::Base
    belongs_to :question
    has_many :answers
  end
end
