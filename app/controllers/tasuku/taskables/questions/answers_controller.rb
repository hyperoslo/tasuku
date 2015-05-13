require_dependency 'tasuku/application_controller'

module Tasuku
  class Taskables::Questions::AnswersController < ApplicationController
    include Concerns::Redirectable

    before_action :set_question

    def update
      answer = Taskables::Question::Answer.find(params[:id])

      return redirect_to :back, alert: I18n.t('tasuku.taskables.questions.answers.no_answers') unless params[:taskables_question_answer]

      answer.votes.destroy_all if ::Tasuku.config.update_answers

      answer_params[:option_ids].each do |num|
        answer.votes.build option_id: num
      end

      answer.author = send ::Tasuku.config.author

      respond_to do |format|
        if answer.save
          format.html { redirect_to redirect_path_for(answer) }
          format.json { render json: answer }
        else
          format.html { redirect_to :back, alert: answer.errors.full_messages.to_sentence }
          format.json { render json: answer.errors }
        end
      end
    end

    def create
      return redirect_to :back, alert: I18n.t('tasuku.taskables.questions.answers.no_answers') unless params[:taskables_question_answer]
      answer = Taskables::Question::Answer.new

      answer_params[:option_ids].each do |num|
        answer.votes.build option_id: num
      end

      answer.author = send ::Tasuku.config.author

      respond_to do |format|
        if answer.save
          format.html { redirect_to redirect_path_for(answer) }
          format.json { render json: answer }
        else
          format.html { redirect_to :back, alert: answer.errors.full_messages.to_sentence }
          format.json { render json: answer.errors }
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
