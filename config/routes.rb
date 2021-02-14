Rails.application.routes.draw do
  devise_for :users
  resources :users
  root 'top#index'
  get 'top/show'

  resources :list, only: %i(new create edit update destroy) do
    resources :card, except: %i(index)
  end
end
