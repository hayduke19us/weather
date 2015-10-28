
desc 'various weather tasks'
namespace :weather do
  task :get do
    ENV['FORECAST'] = env['FORECAST']
    DB = Sequel.connect(env['DATABASE_URL'])
    require './lib/models/weather'
    require './lib/workers/forecast'
    require 'rest-client'
    require './lib/mediators/base'
    require './lib/mediators/get_weather'
    require './lib/mediators/create_weather'

    Workers::Forecast.perform
    DB.disconnect
  end
end
