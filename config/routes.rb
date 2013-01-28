Family::Application.routes.draw do
  mount ElVfsClient::Engine => '/'

  namespace :manage do
    resources :children
  end

  get 'ru/children' => 'children#index', :as => :children
  get 'ru/children/view' => 'children#show', :as => :child

  resources :requests, :only => [:new, :create]
  get 'ru/departament/uchebno-metodicheskiy-tsentr/request' => 'requests#new', :as => :new_request

  get '/(*path)' => 'main#index'
end
