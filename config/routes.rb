Rails.application.routes.draw do
  get 'home/index'

  get  'instagram/connect'
  get  'instagram/callback'
  post 'instagram/disconnect'

  resources :photos, only: [:index] do
    resources :comments, only: [:index]
  end

  root 'home#index'
end
