Library::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end

  devise_for :users

  post "create_user" => "users#create"
  resources :users, :except => [:create]
  resources :books
  resources :lendings
  resources :returns, :only => [:edit, :update]
  resources :categories, :except => [:show]
  resources :temples, :except => [:show]
  resources :courses, :except => [:show]
  resources :course_periods, :except => [:show]
  resources :inventories, :except => [:show]
  resource  :admin, :only => [:show]

  root :to => "home#index"
end
