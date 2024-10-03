class WeatherController < ApplicationController
  def index
    if params[:city].present?
      weather_service = WeatherService.new(params[:city])
      @weather_data = weather_service.fetch_weather
    else
      @weather_data = {}
    end
  end
end

