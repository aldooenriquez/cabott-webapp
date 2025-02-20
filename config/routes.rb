Rails.application.routes.draw do
  resources :branches
  devise_for :users
  resources :users
  resources :vouchers do
    collection do
      get :activities
    end
  end
  resources :activities
  resources :providers

  # Ruta para previsualizar el contenido del mailer
  get 'mailers/preview_voucher', to: 'mailer_previews#preview_voucher'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "vouchers#index"
end
