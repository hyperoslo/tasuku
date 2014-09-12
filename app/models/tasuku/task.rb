module Tasuku
  class Task < ActiveRecord::Base
    include Concerns::Models::Task
    include Concerns::Models::Requirables::Requirable
  end
end
