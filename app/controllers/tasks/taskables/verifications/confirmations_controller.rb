require_dependency "tasks/application_controller"

module Tasks
  class Taskables::Verifications::ConfirmationsController < ApplicationController
    before_action :set_verification

    def create
      confirmation = @verification.confirmations.new author: author

      respond_to do |format|
        if confirmation.save
          format.html { redirect_to :back }
        else
          format.html { render text: 'Failed to confirm verification', status: :unprocessable_entity }
        end
      end
    end

    private

    def author
      author_class.find confirmation_params[:author_id]
    end

    def author_class
      confirmation_params[:author_type].constantize
    end

    def confirmation_params
      params.require(:taskables_verification_confirmation).permit(:author_id, :author_type)
    end

    def set_verification
      @verification = Taskables::Verification.find params[:verification_id]
    end
  end
end
