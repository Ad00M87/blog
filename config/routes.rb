Rails.application.routes.draw do
  root 'static_pages#home'

  get '/about', to: 'static_pages#about'

  # CRUD - CREATE, READ, UPDATE, DELETE
  resources :pages
end
