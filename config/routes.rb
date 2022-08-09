Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users
  resources :organizations
  resources :boards do
    resources :messages, only: %i[create update new edit]
  end
end
