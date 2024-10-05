class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :firstname, :lastname])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :firstname, :lastname])
    end
    
    def test_weather
      city = params[:city] || 'New York'  # Use 'New York' as default city
      weather_service = WeatherService.new(city)
      weather_data = weather_service.fetch_weather
      render json: weather_data
    end
  end
  
  
