Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
        ## here we put the api endpoints
        resources :users, only: [:show]
    end
  end
end
