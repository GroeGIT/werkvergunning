Rails.application.routes.draw do
  resources :enquiries
  mount RailsAdmin::Engine => '/railsadmin', as: 'rails_admin'
 resources :measures
  resources :enquirys, only: [:new, :create, :index, :destroy, :edit] do
    resources :steps, only: [:show, :update], controller: 'enquirys/steps'
  end
 
  root to: 'enquirys_stepsgem#index'

  #voor login:
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


  #routes for signup ., eerste zorgt voor het formulier, 2e haalt data eruit en maakt de user aan
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  #voor nieuwe measurements

 # get '/admin/new' => 'admin#new'
  #post '/admin/new' => 'admin#create'



end
