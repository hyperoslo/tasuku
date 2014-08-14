module Tasuku
  module Taskables
    class Code::Request < ActiveRecord::Base
      include Concerns::Models::Taskables::Code::Request
    end
  end
end
