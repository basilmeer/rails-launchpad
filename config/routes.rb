Rails.application.routes.draw do
  devise_for :users,
    path: 'api/v1/auth',
    controllers: {
      sessions: 'api/v1/sessions',
      registrations: 'api/v1/registrations'
    },
    path_names: {
      registration: "sign_up"
    },
    defaults: { format: :json },
    skip: %i[sessions registrations passwords]

  ## Limiting routes to only those we need for the API
  devise_scope :user do
    ## Registration routes
    post 'api/v1/auth/sign_up', to: 'api/v1/registrations#create'
    put 'api/v1/auth/sign_up', to: 'api/v1/registrations#update'
    delete 'api/v1/auth/sign_up', to: 'api/v1/registrations#destroy'

    # Session routes
    post 'api/v1/auth/sign_in', to: 'api/v1/sessions#create'
    delete 'api/v1/auth/sign_out', to: 'api/v1/sessions#destroy'

    # Password routes
    post 'api/v1/auth/password', to: 'api/v1/passwords#create'
    put 'api/v1/auth/password', to: 'api/v1/passwords#update'
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
  root to: 'rails/health#show'

  namespace :api do
    namespace :v1 do
      resources :users, only: %[index]
    end
  end

end
