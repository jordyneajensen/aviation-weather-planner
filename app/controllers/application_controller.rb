class ApplicationController < ActionController::Base
  # Ensure users are authenticated before accessing certain actions
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Sanitize parameters for user sign-up and account updates
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :firstname, :lastname])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :firstname, :lastname])
  end
  
  # Fetch weather data for a specific city
  def test_weather
    city = params[:city] || 'New York'
    cached_weather = Rails.cache.fetch("weather_#{city}", expires_in: 1.hour) do
      WeatherService.new(city).fetch_weather
    end
    render json: cached_weather
  rescue StandardError => e
    render json: { error: "Failed to fetch weather data: #{e.message}" }, status: :bad_request
  end

  # Redirect user after sign-in
  def after_sign_in_path_for(resource)
    Rails.logger.info("User signed in: #{resource.email}")  # Log user sign-in
    weather_index_path  # Redirect to weather index page
  end

  # Redirect user after sign-out
  def after_sign_out_path_for(resource_or_scope)
    root_path  # Redirect to the root path after sign-out
  end
end

