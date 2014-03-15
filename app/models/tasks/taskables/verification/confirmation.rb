module Tasks
  class Taskables::Verification::Confirmation < ActiveRecord::Base
    belongs_to :verification
    belongs_to :author, polymorphic: true
  end
end
