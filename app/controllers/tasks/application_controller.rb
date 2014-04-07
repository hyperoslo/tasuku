module Tasks
  class ApplicationController < ::ApplicationController
    private

    def after_completion_path_for resource
      if defined? super
        super
      else
        nil
      end
    end
  end
end
