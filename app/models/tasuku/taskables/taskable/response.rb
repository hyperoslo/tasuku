module Tasuku
  module Taskables::Taskable
    class Response < ActiveRecord::Base
      include Tasuku::Concerns::Models::Taskables::Taskable::Response
    end
  end
end
