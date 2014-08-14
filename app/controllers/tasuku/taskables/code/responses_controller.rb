require_dependency 'tasuku/application_controller'

module Tasuku
  class Taskables::Code::ResponsesController < ApplicationController
    include Concerns::Redirectable

    before_action :set_request

    def create
      response = @request.responses.new response_params
      response.author = send Tasks.config.author

      respond_to do |format|
        if response.save
          format.html { redirect_to redirect_path_for(response) }
        else
          format.html { redirect_to :back, alert: response.errors.full_messages.to_sentence }
        end
      end
    end

    private

    def response_params
      params.require(:taskables_code_response).permit(:code)
    end

    def set_request
      @request = Taskables::Code::Request.find params[:request_id]
    end
  end
end
