module Endpoints
  class Weathers < Base
    namespace "/weathers" do

      before do
        content_type :json, charset: 'utf-8'
        response.headers['Access-Control-Allow-Origin'] = 'http://localhost:8080'
      end


      def serialize data, structure = :default
        Serializers::Weather.new(structure).serialize(data)
      end


      get do
        status 200
        encode serialize(Weather.last)
      end

      post do
        status 201
        encode serialize(Weather.create(params))
      end

      get "/:id" do |id|
        encode serialize(Weather.find id: id)
      end

      patch "/:id" do |id|
        status 200
        w = Weather.find id: id
        w.update body_params
        encode serialize w
      end

      delete "/:id" do
        encode Hash.new
      end
    end

    def sanitize params, matcher
      params[matcher] ? true : false
    end
  end
end
