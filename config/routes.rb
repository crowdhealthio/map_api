Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :artifacts, only: [:index, :create]
      resources :types, only: [:index, :show] do
        get 'nearest'
      end
    end
  end
end
