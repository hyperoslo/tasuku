module Tasks::Concerns::Redirectable
  extend ActiveSupport::Concern

  included do
    def redirect_path_for(resource)
      params[:redirect_to] || after_completion_path_for(resource) || :back
    end

    private :redirect_path_for
  end
end
