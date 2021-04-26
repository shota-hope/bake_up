Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root 'pages#index'
  get 'pages/show'
  resources :users, only: :show

  devise_scope :user do
  post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end

end
