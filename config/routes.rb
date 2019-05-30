Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :api do
    namespace :v0 do
      resources :pings, only: [:index], constraints: { format: 'json' }
    end
    namespace :v1 do
      resources :articles, only: [:index, :create, :show] do
        resources :reviews, only: [:create]
      end
      resources :categories, only: [:index]
    end
  end
end
