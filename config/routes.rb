Tasks::Engine.routes.draw do
  resources :tasks, only: [:show]

  scope module: 'taskables' do
    resources :verifications, only: [] do
      scope module: 'verifications' do
        resources :confirmations, only: [:create]
      end
    end
  end
end
