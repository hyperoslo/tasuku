module Tasuku
  module Concerns::Controllers::TasksController
    extend ActiveSupport::Concern

    included do
      before_action :set_task

      def show
      end

      private

      def set_task
        @task = Task.find params[:id]
      end
    end
  end
end
