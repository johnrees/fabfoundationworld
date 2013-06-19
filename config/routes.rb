Fabfoundationworld::Application.routes.draw do
  resources :labs

  namespace 'admin' do
    resources :labs
    root to: 'labs#index'
  end

  root to: 'static#home'
end
