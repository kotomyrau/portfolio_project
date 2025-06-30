Rails.application.routes.draw do
  devise_for :users, skip: [:registrations, :passwords, :confirmations, :unlocks]
  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :projects, path: 'portfolio', only: %i[index show]
  # resources :programmes, path: 'skills', only: :index

  namespace :admin do
    get "/", to: "dashboards#dashboard", as: :dashboard
    resources :projects, except: %i[index show] do
      resources :project_programmes, path: 'project_skills', only: %i[new create destroy]
    end
    resources :programmes, path: 'skills', except: %i[index show]
  end
end
