Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  root to: 'posts#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users, only: [:show, :edit, :update]

  resources :posts do
    resources :comments, only: [:create, :edit, :update, :destroy], shallow: true
    collection do
      get :search
    end
  end

  get '/terms', to: 'static_pages#terms'
  get '/privacy', to: 'static_pages#privacy'
end
