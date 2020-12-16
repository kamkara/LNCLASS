Rails.application.routes.draw do

  resources :exercices

  resources :courses do
    #Enable exercices
    resources :exercices, only: [:index, :create]
  end
  resources :materials
  resources :levels

  root to:'home#index'
  get 'welcome/s_welcome'
  get 'welcome/t_welcome'
  get 'dashboard/index'
  get 'dashboard/tablesclass'

  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
