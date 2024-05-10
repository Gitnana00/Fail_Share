Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users, only: [:show, :edit, :update]
  resources :posts do
    resources :comments, only: [:create, :edit, :update, :destroy], shallow: true
    resources :likes, only: [:create, :destroy]
    collection do
      get :search
    end
  end

  get '/terms', to: 'static_pages#terms'
  get '/privacy', to: 'static_pages#privacy'
end
