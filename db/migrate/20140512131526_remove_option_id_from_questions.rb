class RemoveOptionIdFromQuestions < ActiveRecord::Migration
  class Tasuku::Taskables::Question < ActiveRecord::Base; end

  class Tasuku::Taskables::Question::Answer < ActiveRecord::Base
    self.table_name = 'tasks_taskables_question_answers'
    has_many :votes
    belongs_to :option
  end

  class Tasuku::Taskables::Question::Vote < ActiveRecord::Base
    self.table_name = 'tasks_taskables_question_votes'
    belongs_to :option
    belongs_to :answer
  end

  class Tasuku::Taskables::Question::Option < ActiveRecord::Base
    self.table_name = 'tasks_taskables_question_options'
    belongs_to :vote
    belongs_to :option
  end

  def up
    Tasuku::Taskables::Question::Answer.all.each do |answer|
      answer.votes.create option: answer.option
    end

  	remove_column :tasks_taskables_question_answers, :option_id, :integer
  end
end
