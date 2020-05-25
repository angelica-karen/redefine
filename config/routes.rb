Rails.application.routes.draw do
  get '/dashboard', to: 'users#dashboard'

  post '/users/edit', to: 'users#update'

  root 'pages#home'
  post '/sessions', to: 'sessions#create'

  mount ActionCable.server, at: '/cable'
  devise_for :users, 
              path: '', 
              path_names: {sign_up: 'register', sign_in: 'login', edit: 'profile', sign_out: 'logout'},
              controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}
end
