require_dependency "tasks/application_controller"

module Tasks
  class Taskables::Questions::AnswersController < ApplicationController
    include Concerns::Redirectable

    before_action :set_question

    def create
      answer = Taskables::Question::Answer.new

      answer_params[:option_ids].each do |num|
        answer.votes.build option_id: num
      end

      answer.author = send Tasks.config.author

      respond_to do |format|
        if answer.save
          format.html { redirect_to redirect_path_for(answer) }
        else
          format.html { redirect_to :back, alert: answer.errors.full_messages.to_sentence }
        end
      end
    end

    private

    def answer_params
      params.require(:taskables_question_answer).permit(option_ids: [])
    end

    def set_question
      @question = Taskables::Question.find params[:question_id]
    end
  end
end
