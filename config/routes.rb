Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'registrations' }

  get '/users/:id', to: 'users#show', as: 'user'
  
  get 'static_page/home'
  get 'static_page/help'
  root 'list#index'
  get 'top/show'

  resources :list, only: %i(new create index edit update destroy) do
    resources :card, except: %i(index)
  end
end
