Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :entries, only: [:index, :create]
      resources :images, only: [:index, :create]
      resources :days, only: [:index, :create] do
        resources :entries, only: [:new, :create]
        resources :image, only: [:new, :create]
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
