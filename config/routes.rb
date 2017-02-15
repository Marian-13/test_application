Rails.application.routes.draw do
  get 'home/index'

  get 'instagram/connect'
  get 'instagram/callback'

  resources :photos, only: [:index] do
    resources :comments, only: [:index]
  end

  root 'home#index'
end
