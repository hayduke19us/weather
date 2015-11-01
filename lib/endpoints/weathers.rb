module Endpoints
  class Weathers < Base
    namespace "/weathers" do

      before do
        content_type :json, charset: 'utf-8'

        if Config.pliny_env =~ /\A(development|test)/
          url = 'http://localhost:8080'
          response.headers['Access-Control-Allow-Origin'] = url
        end

      end

      def serialize data, structure = :default
        Serializers::Weather.new(structure).serialize(data)
      end

      get "/current" do 
        status 200
        encode Weather.current
      end

      get "/daily/:limit" do |limit|
        status 200
        encode Weather.daily(limit)
      end

      get do
        status 200
        encode serialize(Weather.all)
      end

      get "/:id" do |id|
        encode serialize(Weather.find id: id)
      end

      delete "/:id" do |id|
        weather = Weather.find(id: id)
        weather.destroy
      end
    end

    def sanitize params, matcher
      params[matcher] ? true : false
    end
  end
end
