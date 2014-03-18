module Tasks
  module Taskables
    class Verification::Confirmation < ActiveRecord::Base
      include Taskable::Submission

      belongs_to :verification
      belongs_to :author, polymorphic: true

      request is: :verification
    end
  end
end
