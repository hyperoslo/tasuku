module Tasks
  class Taskables::Question::Vote < ActiveRecord::Base
    belongs_to :answer, class_name: 'Tasks::Taskables::Question::Answer'
    belongs_to :option, class_name: 'Tasks::Taskables::Question::Option'
  end
end
