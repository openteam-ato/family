Family::Application.routes.draw do
  mount ElVfsClient::Engine => '/'

  namespace :manage do
    resources :children
    get 'adult_children' => 'children#adult'
    root :to => 'children#index'
    resources :contest_works
  end

  get 'ru/children' => 'children#index', :as => :children
  get 'ru/children/view' => 'children#show', :as => :child

  get 'ru/departament/uchebno-metodicheskiy-tsentr/request' => 'requests#new', :as => :new_request
  post 'ru/departament/uchebno-metodicheskiy-tsentr/request' => 'requests#create', :as => :create_request

  get 'ru/dream-picture/' => 'contest_works#index'

  resources :contest_works, :only => [:index] do
    resources :contest_votes, :only => [:create]
  end

  get '/(*path)' => 'main#index'
end
