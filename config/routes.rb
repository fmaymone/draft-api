Rails.application.routes.draw do
  # Define Devise routes
  mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]

  namespace :api do
    namespace :v1 do
      resources :sports
      resources :ladders
      resources :games
      resources :venues
      resources :memberships
      resources :bookings
    end
  end
end
