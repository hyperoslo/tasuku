module Tasuku
  class Taskables::Question::Option < ActiveRecord::Base
    belongs_to :question
    has_many :votes
    has_many :answers, through: :votes
  end
end
