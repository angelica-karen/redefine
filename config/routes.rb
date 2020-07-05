Rails.application.routes.draw do
  
  root 'pages#home'
  get '/dashboard', to: 'users#dashboard'
  get '/users/:id', to: 'users#show', as: 'users'
  get '/selling_orders', to: 'orders#selling_orders'
  get '/buying_orders', to: 'orders#buying_orders'
  get '/all_requests', to: 'requests#list'
  get 'request_offers/:id', to: 'requests#offers', as: 'request_offers'
  get '/my_offers', to: 'requests#my_offers'
  get '/search', to: 'pages#search'

  post '/users/edit', to: 'users#update'
  post '/offers', to: 'offers#create'
  post '/reviews', to: 'reviews#create'

  put '/orders/:id/complete', to: 'orders#complete', as: 'complete_order'
  put '/offers/:id/accept', to: 'offers#accept', as: 'accept_offer'
  put '/offers/:id/reject', to: 'offers#reject', as: 'reject_offer'
  resources :gigs do
    member do
      delete :delete_photo
      post :upload_photo
    end
    resources :orders, only: [:create] #/gigs/15/orders
  end

  resources :requests

  
  post '/sessions', to: 'sessions#create' 

  mount ActionCable.server, at: '/cable'
  devise_for :users, 
              path: '', 
              path_names: {sign_up: 'register', sign_in: 'login', edit: 'profile', sign_out: 'logout'},
              controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}
end
