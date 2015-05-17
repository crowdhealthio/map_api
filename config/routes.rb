Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :artifacts
      resources :types, only: [:index, :show] do
        resources :artifacts, only: [:index]
        get 'nearest'
      end
      resources :nearest, only: [:show]
    end
  end
end
