Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")


  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
    root to: 'devise/sessions#new'
  end

  resources :users, only: [:index, :show, :destroy] do
    resources :posts, only: [:index, :new, :create, :show, :destroy] do 
      resources :comments, only: [:index, :new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end

end
