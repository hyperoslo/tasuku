Rails.application.routes.draw do

  mount Tasks::Engine => "/tasks"
end
