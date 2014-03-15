module Tasks
  class Taskables::Verification < ActiveRecord::Base
    has_one :task, as: :taskable
    belongs_to :verifiable, polymorphic: true
  end
end
