module Tasuku
  module Taskables
    class Question < ActiveRecord::Base
      include Concerns::Models::Taskables::Question
    end
  end
end
