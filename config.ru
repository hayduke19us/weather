require_relative 'lib/application'
require './middlewares/weather_man'

use WeatherMan::WeatherBackend

$stdout.sync = true

run Routes
