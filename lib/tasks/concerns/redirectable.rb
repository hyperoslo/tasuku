module Tasks::Concerns::Redirectable
  extend ActiveSupport::Concern

  included do
    def redirect_path
      params[:redirect_to] || after_completion_path || :back
    end

    def after_completion_path
      config = Tasks.config

      # Configatron considers `nil` not configured and returns a Store instance,
      # which in turn cannot be cast to a string and crashes things.
      if config.after_completion_path.present?
        config.after_completion_path
      else
        nil
      end
    end

    private :redirect_path
    private :after_completion_path
  end
end
