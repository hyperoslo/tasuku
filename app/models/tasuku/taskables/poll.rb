module Tasuku
  module Taskables
    class Poll < ActiveRecord::Base
      include Concerns::Models::Taskables::Poll
    end
  end
end
