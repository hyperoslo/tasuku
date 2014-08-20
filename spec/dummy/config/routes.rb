Rails.application.routes.draw do
  mount Tasks::Engine => "/"

  get "/", to: "application#test", as: :test
end
