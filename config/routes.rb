Rails.application.routes.draw do

  resources :collaborations do
    member do
      get :delete
    end
  end

  resources :theses, only: [:index, :new, :create, :destroy, :edit, :update]  

  root 'public_views#index'

  # user access
  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  get 'pages/about'
  #get 'about' => 'pages#about'

  resources :public_views

  resources :students do
    member do
      get :delete
    end
  end

end
