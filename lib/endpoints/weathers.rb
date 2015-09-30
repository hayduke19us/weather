module Endpoints
  class Weathers < Base
    namespace "/weathers" do
      before do
        content_type :json, charset: 'utf-8'
      end

      def serialize data, structure = :default
        Serializers::Weather.new(structure).serialize(data)
      end

      get do
        encode serialize(Weather.all)
      end

      post do
        status 201
        encode serialize(Weather.create(params))
      end

      get "/:id" do
        encode Weather.find(params[:id])
      end

      patch "/:id" do
        encode Hash.new
      end

      delete "/:id" do
        encode Hash.new
      end
    end
  end
end
