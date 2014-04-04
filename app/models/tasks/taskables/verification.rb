module Tasks
  module Taskables
    class Verification < ActiveRecord::Base
      include Tasks::Concerns::Models::Taskables::Verification
    end
  end
end
