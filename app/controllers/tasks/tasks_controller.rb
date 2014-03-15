require_dependency "tasks/application_controller"

module Tasks
  class TasksController < ApplicationController
    before_action :set_task

    def show
    end

    def complete
      submission = @task.taskable.submissions.new submission_params

      respond_to do |format|
        if submission.save
          format.json { render json: submission, status: :ok }
          format.html { redirect_to :back }
        else
          format.json { render json: submission.errors, status: :unprocessable_entity }
          format.html { render text: 'Failed to complete task', status: :unprocessable_entity }
        end
      end
    end

    private

    def set_task
      @task = Task.find params[:id]
    end

    def submission_params
      params.require(:submission).permit!
    end
  end
end
