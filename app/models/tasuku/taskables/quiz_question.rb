module Tasuku
  module Taskables
    class QuizQuestion < ActiveRecord::Base
      include Concerns::Models::Taskables::QuizQuestion
    end
  end
end
