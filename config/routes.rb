Rails.application.routes.draw do
  root 'pages#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users, only:[:index, :show]
  devise_scope :user do
  post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :posts, only:[:show, :create, :destroy] do
    resources :comments, only: [:create]
  end

end
