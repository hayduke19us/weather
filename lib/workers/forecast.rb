require 'sidekiq'
require 'colorize'

module Worker
  class Forecast
    include Sidekiq::Worker

    def self.perform
      response = "{status: 'success'}"
      puts response.colorize(:green)
    end
  end
end
