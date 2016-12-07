Rails.application.routes.draw do
  resources :enquirys, only: [:new, :create, :index, :destroy, :edit] do
    resources :steps, only: [:show, :update], controller: 'enquirys/steps'
  end
 
  root to: 'enquirys#index'

  #voor login:
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


  #routes for signup ., eerste zorgt voor het formulier, 2e haalt data eruit en maakt de user aan
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

end
