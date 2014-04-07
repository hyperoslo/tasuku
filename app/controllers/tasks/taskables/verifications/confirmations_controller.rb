require_dependency "tasks/application_controller"

module Tasks
  class Taskables::Verifications::ConfirmationsController < ApplicationController
    include Concerns::Redirectable

    before_action :set_verification

    def create
      confirmation = @verification.confirmations.new
      confirmation.author = send Tasks.config.author

      respond_to do |format|
        if confirmation.save
          format.html { redirect_to redirect_path }
        else
          format.html { render text: 'Failed to confirm verification', status: :unprocessable_entity }
        end
      end
    end

    private

    def set_verification
      @verification = Taskables::Verification.find params[:verification_id]
    end
  end
end
