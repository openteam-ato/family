Family::Application.routes.draw do
  mount ElVfsClient::Engine => '/'

  namespace :manage do
    resources :children
  end

  resources :children, :only => [:index, :show], :path => '/ru/children'

  get '/(*path)', :to => 'main#index'
end
