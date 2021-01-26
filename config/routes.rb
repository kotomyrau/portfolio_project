Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, :path => 'account', controllers: { registrations: "users/registrations"}
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :projects, :path => 'portfolio', only: [:index, :show]
  resources :programmes, :path => 'skills', only: [:show]

  resources :users, :path => 'account', only: :index do
    resources :projects, :path => 'portfolio', except: [:index, :show] do
      resources :project_programmes, :path => 'project_skills', only: [:new, :create]
    end
    resources :programmes, :path => 'skills', except: [:index, :show]
  end
end
