require_dependency 'tasuku/application_controller'

module Tasuku
  class Taskables::Quizzes::QuizzesController < ApplicationController
    include Concerns::Redirectable

    before_action :quiz_params

    # TODO: Add update controller to submitt answers all at once. Maybe?
    
    private

    def quiz_params
      binding.pry
      params.require(:taskables_quiz).permit({taskables_question_answer: [option_ids: [] ] })
    end

  end
end
