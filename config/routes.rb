Rails.application.routes.draw do
  # resources :catalogs, path_names: { new: 'search' }
  get 'catalog/index'

  get 'catalog/show'
  get 'catalog/show/:id', to: 'catalog#show'

  get 'catalog/search'
  get 'catalog/search/:id', to: 'catalog#search'

  get 'catalog/latest'
  get 'catalog/latest/:id', to: 'catalog#latest'

  get 'catalog/rss', format: 'application/xml'

  namespace :admin do
    resources :author
    resources :publishers
    resources :books
  end

  get 'about/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
