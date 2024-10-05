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

    def after_sign_in_path_for(resource)
      # Redirect to the weather index or any other path you prefer
      weather_index_path
    end
  
    def after_sign_out_path_for(resource_or_scope)
      # Redirect to the root path or any other path you prefer
      root_path
    end
  end
  
  
