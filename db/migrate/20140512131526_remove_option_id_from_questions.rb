class RemoveOptionIdFromQuestions < ActiveRecord::Migration
  class Tasks::Taskables::Question < ActiveRecord::Base; end

  class Tasks::Taskables::Question::Answer < ActiveRecord::Base
    self.table_name = "tasks_taskables_question_answers"
    has_many :votes
    belongs_to :option
  end

  class Tasks::Taskables::Question::Vote < ActiveRecord::Base
    belongs_to :option
    belongs_to :answer
  end

  def up
    Tasks::Taskables::Question::Answer.all.each do |answer|
      answer.votes.create option: answer.option
    end

  	remove_column :tasks_taskables_question_answers, :option_id, :integer
  end
end
