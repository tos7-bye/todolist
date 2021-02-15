Rails.application.routes.draw do
  devise_for :users
  get '/users/:id', to: 'users#show', as: 'user'
  
  get 'static_page/home'
  get 'static_page/help'
  root 'top#index'

  get 'top/show'

  resources :list, only: %i(new create edit update destroy) do
    resources :card, except: %i(index)
  end
end
