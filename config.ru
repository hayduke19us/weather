require_relative 'lib/application'
require './middlewares/weather_man'
require 'simple_session'

use SimpleSession::Session, secret: Config.cookie_secret, max_age: 20
use WeatherMan::WeatherBackend

$stdout.sync = true

run Routes
