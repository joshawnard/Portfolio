Rails.application.routes.draw do
  devise_for :users, path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               sign_up: 'register'
             }

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs do
    member do
      get 'toggle-status'
    end
  end

  resources :projects, except: [:show]
  get 'project/:id', to: 'projects#show', as: 'project_show'
  get 'angular-projects', to: 'projects#angular'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#home'
end
