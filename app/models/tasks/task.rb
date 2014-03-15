module Tasks
  class Task < ActiveRecord::Base
    belongs_to :taskable, polymorphic: true
  end
end
