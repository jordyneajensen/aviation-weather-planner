class WeatherController < ApplicationController
  def index
    if params[:city].present?
      weather_service = WeatherService.new(params[:city])
      @weather_data = weather_service.fetch_weather
      Rails.logger.debug("Weather Data: #{@weather_data.inspect}") # Add this line
    else
      @weather_data = {}
    end
  end
  
end

