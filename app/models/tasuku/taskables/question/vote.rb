module Tasuku
  class Taskables::Question::Vote < ActiveRecord::Base
    belongs_to :answer, class_name: 'Tasuku::Taskables::Question::Answer'
    belongs_to :option, class_name: 'Tasuku::Taskables::Question::Option'
  end
end
