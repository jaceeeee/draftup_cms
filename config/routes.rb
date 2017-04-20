Rails.application.routes.draw do

  # root path
  root 'public_views#index'

# resourceful route for :collaborations
  resources :collaborations do
    member do
      get :delete
    end
  end

# resourceful route for :thesis
  resources :theses, only: [:index, :new, :create, :destroy, :edit, :update]

# user access
  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

# public pages
  get 'pages/about'
# optional, future purposes
# get 'about' => 'pages#about'

# resourceful routes for :public_views
  resources :public_views

# resourceful routes for :students
  resources :students do
    member do
      get :delete
    end
  end

end
