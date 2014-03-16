module Tasks
  module Taskables::VerificationsHelper

    # Render a button to confirm the given verification.
    #
    # verification - A Verification instance.
    # options      - A Hash of options:
    #                :for - A model instance describing the author of the confirmation.
    #
    # Example:
    #
    #   confirm terms_of_service.verification, for: current_user
    #
    def confirm verification, options
      author = options[:for]

      render partial: 'tasks/taskables/verifications/confirmations/form.html.erb', locals: {
        confirmation: verification.confirmations.build,
        author: author
      }
    end
  end
end
