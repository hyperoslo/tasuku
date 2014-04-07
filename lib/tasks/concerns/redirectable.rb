module Tasks::Concerns::Redirectable
  extend ActiveSupport::Concern

  included do
    def redirect_path
      params[:redirect_to] || :back
    end

    private :redirect_path
  end
end
