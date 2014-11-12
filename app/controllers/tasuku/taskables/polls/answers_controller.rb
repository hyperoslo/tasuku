require_dependency 'tasuku/application_controller'

module Tasuku
  class Taskables::Polls::AnswersController < ApplicationController
    include Concerns::Redirectable

    before_action :set_poll

    def create
      return redirect_to :back, alert: I18n.t('tasuku.taskables.polls.answers.no_answers') unless params[:taskables_poll_answer]
      answer = Taskables::Poll::Answer.new

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
      params.require(:taskables_poll_answer).permit(option_ids: [])
    end

    def set_poll
      @poll = Taskables::Poll.find params[:poll_id]
    end
  end
end
