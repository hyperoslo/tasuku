module Tasks
  class Taskables::Question::Answer < ActiveRecord::Base
    belongs_to :option
    belongs_to :author, polymorphic: true
  end
end
