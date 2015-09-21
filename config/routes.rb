Tasuku::Engine.routes.draw do
  resources :tasks, only: [:show]

  namespace :taskables do
    resources :verifications, only: [] do
      scope module: :verifications do
        resources :confirmations, only: [:create]
      end
    end

    resources :polls, only: [] do
      scope module: :polls do
        resources :answers, only: [:create]
      end
    end

    resources :questions, only: [] do
      scope module: :questions do
        resources :answers, only: [:create, :update]
      end
    end

    resources :quizzes, only: [:create, :update] do
      scope module: :quizzes do
        resource :questions, only: [] do
          resources :answers, only: [:create, :update]
        end
      end
    end

    namespace :image do
      resources :requests, only: [] do
        resources :responses, only: [:create]
      end
    end

    namespace :text do
      resources :requests, only:  [] do
        resources :responses, only: [:create]
      end
    end

    namespace :url do
      resources :requests, only: [] do
        resources :responses, only: [:create]
      end
    end

    namespace :code do
      resources :requests, only: [] do
        resources :responses, only: [:create]
      end
    end
  end
end
