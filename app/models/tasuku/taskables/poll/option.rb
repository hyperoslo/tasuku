module Tasuku
  class Taskables::Poll::Option < ActiveRecord::Base
    belongs_to :poll
    has_many :votes
    has_many :answers, through: :votes

    validates_presence_of :text
  end
end

