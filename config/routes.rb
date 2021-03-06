Rails.application.routes.draw do
  get 'contacts/new'
  get 'messages/new'
  get 'comments/new'
  get 'topics/new'
  get 'sessions/new'
  get 'users/new'
  get 'pages/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get 'pages/help'
  resources :users
  resources :topics
  resources :comments
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get 'favorites/index'
  post '/favorites' , to: 'favorites#create'
  post '/favorites/destroy' , to: 'favorites#destroy'
  post '/comments' , to: 'comments#create'

  get 'contacts/new'
  post '/contact', to: 'contacts#create'
  mount LetterOpenerWeb::Engine, at:"/letter_opener_web" if Rails.env.development?
end
