Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :projects, only: [:index, :show]
  resources :programmes, only: [:show]

  resources :users, only: :index do
    resources :projects, except: [:index, :show] do
      resources :project_programmes, only: [:new, :create]
    end
    resources :programmes, except: [:index, :show]

  end
end
