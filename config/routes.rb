Library::Application.routes.draw do
  authenticated :user do
    root :to => 'admins#show'
  end

  devise_for :users, :skip => [:registrations]

  post "create_user" => "users#create"
  resources :users, :except => [:create]
  resources :books
  resources :lendings, :except => [:show]
  resources :returns, :only => [:edit, :update]
  resources :categories, :except => [:show]
  resources :temples, :except => [:show]
  resources :courses, :except => [:show]
  resources :course_periods, :except => [:show]
  resource  :admin, :only => [:show]

  root :to => "home#index"
end
