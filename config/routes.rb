Library::Application.routes.draw do
  root :to => "home#index"
  ActiveAdmin.routes(self)

  devise_for :users, :skip => [:registrations]
  resources :books
  resources :lendings, :except => [:show, :edit, :update]
  resources :returns, :only => [:edit, :update]

end
