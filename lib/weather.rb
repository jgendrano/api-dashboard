require "net/http"
require "json"
require "pry"
require 'dotenv'
Dotenv.load


class Weather
  attr_reader :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def weather_data
    get_weather
  end

  private
  def get_weather
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end

  def uri
    key = ENV["APIKEY"]
    URI("https://api.forecast.io/forecast/#{key}/#{@latitude},#{@longitude}")
  end
end
