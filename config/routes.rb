Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    # vessel
    get '/vessel', to: 'vessel#index'
    post '/vessel', to: 'vessel#create', as: :create_vessel
    patch '/vessel/:id', to: 'vessel#update'
  end
end
