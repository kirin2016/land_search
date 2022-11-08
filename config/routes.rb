Rails.application.routes.draw do

  devise_for :customers, controllers: {
    sessions: 'publics/devises/sessions',
    passwords: 'publics/devises/passwords',
    registrations: 'publics/devises/registrations'
  }

  scope module: :publics do
    root to: 'homes#top'
    resources :bookmarks, only: [:index, :create, :destroy]
    resources :customers, only: [:show, :edit, :order, :update]
    resources :land_percels, only: [:show]
    resources :plan_orders, only: [:index, :show]
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
    resources :land_percels, only: [:show, :new, :create, :edit, :update, :destroy]
    resources :plan_orders, only: [:index, :show, :update]
    resources :properties do
      collection do
        get :search
      end
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
