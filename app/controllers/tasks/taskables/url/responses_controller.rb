require_dependency "tasks/application_controller"

module Tasks
  class Taskables::URL::ResponsesController < ApplicationController
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
      params.require(:taskables_url_response).permit(:url)
    end

    def set_request
      @request = Taskables::URL::Request.find params[:request_id]
    end
  end
end
