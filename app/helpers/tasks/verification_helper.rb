module Tasks
  module VerificationHelper
    # Create a form to verify something on the behalf of someone.
    #
    # verifiable - A model that is verifyable (e.g. terms of service or an article)
    # options    - A Hash of options:
    #              :for      - An author
    def verify verifiable, options
      author = options[:for]

      form_tag Tasks::Engine.routes.url_helpers.complete_task_path(verifiable.verification.task), method: :post do
        concat hidden_field_tag 'submission[verifiable_type]', verifiable.class.name
        concat hidden_field_tag 'submission[verifiable_id]', verifiable.id
        concat hidden_field_tag 'submission[author_type]', author.class.name
        concat hidden_field_tag 'submission[author_id]', author.id

        concat submit_tag I18n.t 'tasks.complete'
      end
    end
  end
end
