Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'tokens/create'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
        ## here we put the api endpoints
        resources :tokens, only: [:create]
        resources :users, only: %i[show create update destroy]
        resources :customer, only: [:show]
    end
  end
end
