Rails.application.routes.draw do
  namespace :admin do
    resources :author
    resources :publishers
    resources :books
  end

  get 'about/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
