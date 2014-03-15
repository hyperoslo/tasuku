module Tasks
  module ApplicationHelper

    # Render a button to confirm the given verififiable.
    #
    # verifiable - Any model that can be verified.
    # options    - A Hash of options:
    #              :for - Any model that can verify.
    #
    # Example:
    #
    #   confirm terms_of_service, for: current_user
    #
    # Returns a string.
    def confirm verifiable, options
      author = options[:for]

      render partial: 'tasks/taskables/verifications/confirmations/form.html.erb', locals: {
        confirmation: verifiable.verification.confirmations.build,
        author: author
      }
    end
  end
end
