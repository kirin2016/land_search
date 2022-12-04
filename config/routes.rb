Rails.application.routes.draw do

  namespace :admins do
    get 'images/create'
    get 'images/destroy'
  end
  namespace :admin do
    get 'images/create'
    get 'images/destroy'
  end
  get 'images/create'
  get 'images/destroy'
  devise_for :customers, controllers: {
    sessions: 'publics/devises/sessions',
    passwords: 'publics/devises/passwords',
    registrations: 'publics/devises/registrations'
  }

  scope module: :publics do
    root to: 'homes#top'
    resources :bookmarks, only: [:index, :create, :destroy]
    resources :customers, only: [:show, :edit, :update]
    get 'customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch 'customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
    resources :land_percels, only: [:show]
    resources :plan_orders, only: [:show, :create]
    get 'plan_orders/:id/registration' => 'plan_orders#registration', as: 'plan_orders/registration'
    resources :properties, only: [:index, :show] do
      collection do
        get :search
      end
    end
  end


  devise_for :admins, controllers: {
    sessions: 'admins/devises/sessions',
  }

  namespace :admins do
    get "/" => "properties#index"
    resources :customers, only: [:index, :show, :edit, :update]
    resources :images, only: [:create, :destroy]
    resources :land_percels, only: [:show, :new, :create, :edit, :update, :destroy] do
      collection do
        post :new_create
      end
    end
    get 'land_percels/:id/registration' => 'land_percels#registration', as: 'land_percels/registration'
    resources :plan_orders, only: [:index, :show, :update]
    resources :properties do
      collection do
        get :search
      end
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
