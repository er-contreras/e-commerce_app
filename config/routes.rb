Rails.application.routes.draw do
  get 'about/index'

  namespace :admin do
    resources :author
    resources :publishers
    resources :books
  end

  get 'catalog/index'
  get 'catalog/show'
  get 'catalog/show/:id', to: 'catalog#show'
  get 'catalog/search'
  get 'catalog/search/:id', to: 'catalog#search'
  get 'catalog/latest'
  get 'catalog/latest/:id', to: 'catalog#latest'
  get 'catalog/rss', format: 'application/xml'
  patch '/book/:id/move', to: 'catalog#move'
  get 'catalog/data'

  # get 'add', to: 'cart#add'
  post 'add', to: 'cart#add'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
