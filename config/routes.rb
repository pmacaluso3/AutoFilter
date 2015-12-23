Rails.application.routes.draw do
  root 'cars#index'

  resources :cars, only: [:index]
  get "hide/:id" => 'cars#hide'
end
