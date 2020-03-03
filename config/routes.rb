Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    get '/search', to: 'companies#search'
    resources :companies do
      resources :founders, only: :create
    end
  end
end
