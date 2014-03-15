require_dependency "tasks/application_controller"

module Tasks
  class TasksController < ApplicationController
    before_action :set_task

    def show
    end

    private

    def set_task
      @task = Task.find params[:id]
    end
  end
end
