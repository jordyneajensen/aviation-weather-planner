require 'net/http'
require 'json'

class WeatherService
  BASE_URL = 'https://api.openweathermap.org/data/2.5/weather'

  def initialize(city)
    @city = city
    @api_key = ENV['WEATHER_API_KEY']
  end

  def fetch_weather
    url = "#{BASE_URL}?q=#{@city}&appid=#{@api_key}&units=metric"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  rescue StandardError => e
    { error: "Failed to retrieve weather data", message: e.message }
  end
end

