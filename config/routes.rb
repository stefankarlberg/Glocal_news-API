Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      resources :pings, only: [:index], constraints: { format: 'json' }
    end
    namespace :v1 do
      resources :articles, only: [:index, :create, :show]
      resources :categories, only: [:index]
    end
  end
end
