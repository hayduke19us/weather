module Worker
  class Forecast
    include Sidekiq::Worker

    def self.perform(how_hard="super hard", how_long=1)
      sleep how_long
      puts "Workin' #{how_hard}"
    end
  end
end
