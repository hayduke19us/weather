require_relative 'lib/application'
require './middlewares/weather_man'
require 'simple_session'

use WeatherMan::WeatherBackend

$stdout.sync = true

run Routes
