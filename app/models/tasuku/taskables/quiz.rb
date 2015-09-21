module Tasuku
  module Taskables
    class Quiz < ActiveRecord::Base
      include Concerns::Models::Taskables::Quiz
    end
  end
end
