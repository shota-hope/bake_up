Rails.application.routes.draw do
  root 'pages#index'
  resources :users, :only => [:show]
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
  post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end

end
