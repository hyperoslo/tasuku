require_dependency "tasks/application_controller"

module Tasks
  class Taskables::Questions::AnswersController < ApplicationController
    before_action :set_question

    def create
      answer = @question.answers.new answer_params
      answer.author = send Tasks.config.author

      respond_to do |format|
        if answer.save
          format.html { redirect_to :back }
        else
          format.html { render text: 'Failed to answer question', status: :unprocessable_entity }
        end
      end
    end

    private

    def answer_params
      params.require(:taskables_question_answer).permit(:option_id, :author_id, :author_type)
    end

    def set_question
      @question  = Taskables::Question.find params[:question_id]
    end
  end
end
