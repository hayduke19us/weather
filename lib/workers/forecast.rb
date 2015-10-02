require 'sidekiq'
require 'colorize'

module Worker
  class Forecast
    include Sidekiq::Worker

    def self.perform()
      puts "Workin my ass off".colorize(:green)
    end
  end
end
