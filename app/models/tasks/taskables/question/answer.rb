module Tasks
  class Taskables::Question::Answer < ActiveRecord::Base
    belongs_to :option
    belongs_to :author, polymorphic: true

    validates :option_id, presence: true
    validates :author_id, :author_type, presence: true
  end
end
