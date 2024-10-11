# app/services/weather_service.rb

require 'net/http'
require 'json'

class WeatherService
  BASE_URL = 'https://api.openweathermap.org/data/2.5/weather'.freeze

  def initialize(city)
    @city = city
    @api_key = ENV['WEATHER_API_KEY'] # Ensure your API key is set in environment variables
  end

  def fetch_weather
    url = "#{BASE_URL}?q=#{@city}&appid=#{@api_key}&units=metric"
    uri = URI(url)

    response = Net::HTTP.get(uri)
    parsed_response = JSON.parse(response)

    # Return a structured response with relevant weather data
    {
      city: parsed_response['name'],
      temperature: parsed_response['main']['temp'],
      weather: parsed_response['weather'].first['description'],
      humidity: parsed_response['main']['humidity'],
      wind_speed: parsed_response['wind']['speed'],
      cloud_coverage: parsed_response['clouds']['all'],
      pressure: parsed_response['main']['pressure'],
      visibility: parsed_response['visibility']
    }
  rescue StandardError => e
    { error: "Failed to retrieve weather data", message: e.message }
  end
end


