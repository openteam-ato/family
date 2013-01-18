Family::Application.routes.draw do
  mount ElVfsClient::Engine => '/'

  resources :children

  get '/(*path)', :to => 'main#index'
end
