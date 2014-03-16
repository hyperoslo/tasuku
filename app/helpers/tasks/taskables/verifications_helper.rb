module Tasks
  module Taskables::VerificationsHelper

    # Render a button to confirm the given verification.
    #
    # verification - A Verification instance.
    #
    # Example:
    #
    #   confirm terms_of_service.verification
    #
    def confirm verification
      render partial: 'tasks/taskables/verifications/confirmations/form.html.erb', locals: {
        confirmation: verification.confirmations.build
      }
    end
  end
end
