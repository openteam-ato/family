Family::Application.routes.draw do
  mount ElVfsClient::Engine => '/'

  namespace :manage do
    resources :children
  end

  get 'ru/children' => 'children#index', :as => :children
  get 'ru/children/view' => 'children#show', :as => :child

  get '/(*path)', :to => 'main#index'
end
