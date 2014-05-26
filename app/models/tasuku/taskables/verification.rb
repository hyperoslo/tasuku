module Tasuku
  module Taskables
    class Verification < ActiveRecord::Base
      include Tasuku::Concerns::Models::Taskables::Verification
    end
  end
end
