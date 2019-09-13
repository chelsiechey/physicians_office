Rails.application.routes.draw do

root 'physicians#index'
  resources :physicians do
    resources :appointments
  end

  resources :patients

  get '/search' => 'pages#search', :as => 'search_page'

  get '/search_phys' => 'pages#search_phys', :as => 'search_phys_page'
end

