Library::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end

  devise_for :users
  resources :users
  resources :books
  resources :categories, :except => [:show]
  resources :temples, :except => [:show]
  resources :courses, :except => [:show]

  root :to => "home#index"
end
