Fabfoundationworld::Application.routes.draw do
  resources :labs

  root to: 'static#home'
end
