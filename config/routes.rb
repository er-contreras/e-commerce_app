Rails.application.routes.draw do
  namespace :admin do
    get 'author/new'

    get 'author/create'
    post 'author/create'

    get 'author/edit'

    get 'author/update'

    get 'author/destroy'

    get 'author/show'
    get 'author/show/:id', to: 'author#show'

    get 'author/index'
  end
  get 'about/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
