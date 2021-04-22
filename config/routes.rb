Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  get 'pages/show'
  post '/pages/guest_sign_in', to: 'homes#new_guest'

end
