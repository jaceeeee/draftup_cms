Rails.application.routes.draw do

  root 'posts#index'

  # user access
  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  get 'pages/about'
  #get 'about' => 'pages#about'

  resources :posts

  resources :students do
    member do
      get :delete
    end
  end

end
