module Tasuku
  class Task < ActiveRecord::Base
    include Concerns::Models::Task
  end
end
