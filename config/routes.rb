Family::Application.routes.draw do
  devise_for :users, controllers: {
    sessions:       'users/sessions',
    registrations:  'users/registrations',
    passwords:      'users/passwords',
    confirmations:  'users/confirmations'
  }

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

  get 'ru/dream-picture' => 'contest_works#index'

  resources :social_providers, :only => [:index, :show], :path => '/ru/reestr-postavschikov-sotsialnyh-uslug'

  namespace :my do
    resources :social_providers do
      post 'pending', :on => :member
    end
  end

  resources :contest_works, :only => [:index] do
    resources :contest_votes, :only => [:create]
  end

  get '/(*path)' => 'application#index'
end
