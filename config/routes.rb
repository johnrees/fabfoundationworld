Fabfoundationworld::Application.routes.draw do

  resources :labs do
    get :created, as: :collection
  end

  get 'map', to: 'labs#map'

  namespace 'admin' do
    resources :labs
    resources :tools
    root to: 'labs#index'
  end

  root to: 'static#home'
end
