Rails.application.routes.draw do
  use_doorkeeper
  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end
  
  namespace :api do
    namespace :v1 do
      resources :articles
    end
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "articles#index"
  resources :articles do
    resources :comments
  end
  ActiveAdmin.routes(self)

  # Defines the root path route ("/")
  
end
