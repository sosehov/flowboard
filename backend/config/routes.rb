Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :boards do
        resources :lists, only: [:index, :create]
      end

      resources :lists, only: [:show, :update, destroy] do
        resources :cards, only: [:index, :create]
      end

      resources :cards, only: [:show, :update, :destroy]
    end
  end
end
