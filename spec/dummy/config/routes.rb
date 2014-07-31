Rails.application.routes.draw do

  mount Tasks::Engine => "/tasks"

  get "/", to: "application#test", as: :test
end
