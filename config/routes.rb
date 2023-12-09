Rails.application.routes.draw do
  # Rails Router Docs - [https://guides.rubyonrails.org/routing.html]

  # =========
  # Home page
  # =========
  root to: "root#index"

  # =========
  # Campaigns
  # =========
  resources :campaigns do
    resources :players
  end

  # ==============
  # Authentication
  # ==============
  devise_for :users

  # =============
  # Health Checks
  # =============
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
