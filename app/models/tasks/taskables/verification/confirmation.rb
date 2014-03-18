module Tasks
  module Taskables
    class Verification::Confirmation < ActiveRecord::Base
      include Taskable::Submission

      belongs_to :verification
      belongs_to :author, polymorphic: true

      submissions of: :verification
    end
  end
end
