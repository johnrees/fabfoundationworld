Fabfoundationworld::Application.routes.draw do

  resources :labs do
    get :created, as: :collection
  end

  namespace 'admin' do
    resources :labs
    root to: 'labs#index'
  end

  root to: 'static#home'
end
