class WeatherController < ApplicationController
  def index
    city = params[:city] || 'New York'  # Use 'New York' as the default city
    weather_service = WeatherService.new(city)
    @weather_data = weather_service.fetch_weather
  end
end
