Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  get 'pages/show'
  devise_scope :user do
  post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end
end
