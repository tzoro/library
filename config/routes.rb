Rails.application.routes.draw do
  get '/books/outofstock', to: 'books#out_of_stock'
  resources :loans
  resources :books
  resources :authors
  mount_devise_token_auth_for 'User', at: 'auth'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
