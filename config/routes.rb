Rails.application.routes.draw do
  # resources :degradations
  # resources :furnitures
  # resources :priorities
  # resources :statuses

  # AS SOMEONE THAT REPORTS AN INIDENT
  resources :cities, only: []  do
    member do
      get :infos
    end
  end

  # AS CITY OWNER
  resource :city, only: [:show, :edit, :update]

  resources :reports do #, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :messages, only: [:index, :new, :create]
  end

  # resources :messages, only: [ :show ]

  # resources :users, only: [:index, :show, :new, :create, :update, :edit]

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Attachinary::Engine => "/attachinary"
end
