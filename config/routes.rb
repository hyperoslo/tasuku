Tasks::Engine.routes.draw do
  resources :tasks, only: [:show] do
    post :complete, on: :member
  end
end
