require "./lib/geolocation"
require "./lib/weather"
require "sinatra/base"
require "pry"

require "dotenv"
Dotenv.load

class Dashboard < Sinatra::Base
  def geolocation_init
    @ip = request.ip
    @geolocation = Geolocation.new(@ip)
  end

  def weather_init
    @weather = Weather.new(@geolocation.latitude, @geolocation.longitude)
  end

  get("/") do
    geolocation_init
    erb :dashboard
  end

  get("/weather") do
    geolocation_init
    weather_init
    erb :weather
  end

end
