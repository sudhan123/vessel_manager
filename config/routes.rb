Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    # vessel
    get '/vessel', to: 'vessel#index'
    post '/vessel', to: 'vessel#create'
    patch '/vessel/:id', to: 'vessel#update'

    # voyage
    get '/voyage', to: 'voyage#index'
    post '/voyage', to: 'voyage#create'
    patch '/voyage/:id', to: 'voyage#update'
  end
end
