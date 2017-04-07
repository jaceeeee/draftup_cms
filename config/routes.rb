Rails.application.routes.draw do  

  root 'posts#index'

  get 'pages/about'
  #get 'about' => 'pages#about'

  resources :posts

  resources :students do
    member do
      get :delete
    end
  end

end
