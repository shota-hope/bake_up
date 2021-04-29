Rails.application.routes.draw do
  root 'pages#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users, only:[:show]
  devise_scope :user do
  post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :posts, only:[:create, :destroy]

end
