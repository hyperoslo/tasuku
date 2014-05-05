require_dependency "tasks/application_controller"

module Tasks
  class Taskables::Questions::AnswersController < ApplicationController
    include Concerns::Redirectable

    before_action :set_question

    def create
      answer = @question.answers.new answer_params
      answer.author = send Tasks.config.author

      respond_to do |format|
        if answer.save
          format.html { redirect_to redirect_path_for(answer) }
        else
          format.html { render text: answer.errors.full_messages, status: :unprocessable_entity }
        end
      end
    end

    private

    def answer_params
      params.permit(:taskables_question_answer).permit(:option_id, :author_id, :author_type)
    end

    def set_question
      @question = Taskables::Question.find params[:question_id]
    end
  end
end
