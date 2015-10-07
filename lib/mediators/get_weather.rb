class Mediators::GetWeather < Mediators::Base

  attr_reader :service, :latlong, :date, :key, :response

  def initialize(args)
    @service = args.fetch(:service, 'http://api.forecast.io/forecast')
    @latlong = args.fetch(:latlong, [45.5200, -122.6819])
    @date    = args.fetch(:date,    Time.now.to_i)
    @key     = ENV["FORECAST"]
  end

  def call
    begin
      self.request
      return self.response
    rescue => e
      "A request to forcast.io failed #{e}"
    end
  end

  def request
    self.response = ::RestClient.get(self.request_url)
  end

  def response=(res)
    @response = res
  end

  def request_url
    url = "#{@service}/#{self.key}/#{self.latlong.join(',')}"
    url << ",#{self.date}" if self.date
    url
  end
end
