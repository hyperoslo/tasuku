require_dependency 'tasuku/application_controller'

module Tasuku
  class TasksController < ApplicationController
    include Concerns::Controllers::TasksController
  end
end
