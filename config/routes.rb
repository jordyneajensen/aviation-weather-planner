Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }


  # Weather-related routes
  get 'weather/index', to: 'weather#index', as: :weather_index
  get 'weather/:city', to: 'application#test_weather', as: :test_weather
  get 'weather', to: 'weather#index'

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Root route
  root "home#index"  # Ensure this is set correctly
end


