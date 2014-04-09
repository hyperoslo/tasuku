require_dependency "tasks/application_controller"

module Tasks
  class TasksController < ApplicationController
    include Concerns::Controllers::TasksController
  end
end
