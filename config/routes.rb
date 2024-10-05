Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :users

  # Weather-related routes
  get 'weather/index'
  get 'weather/:city', to: 'application#test_weather', as: :test_weather
  get 'weather', to: 'weather#index'


  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Root route (you can define your root later)
  # root "posts#index"
end

