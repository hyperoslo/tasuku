module Tasks
  class Taskables::Question::Answer < ActiveRecord::Base
    belongs_to :option
    belongs_to :author, polymorphic: true

    validates :option_id, presence: true
  end
end
