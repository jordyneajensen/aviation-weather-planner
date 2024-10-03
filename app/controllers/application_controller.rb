class ApplicationController < ActionController::Base
    def test_weather
      city = params[:city] || 'New York'  # Use 'New York' as default city
      weather_service = WeatherService.new(city)
      weather_data = weather_service.fetch_weather
      render json: weather_data
    end
  end
  
  
