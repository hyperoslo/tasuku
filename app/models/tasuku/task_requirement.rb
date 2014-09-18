module Tasuku
  class TaskRequirement < ActiveRecord::Base
    include Concerns::Models::Requirables::InverseRequirable
  end
end
