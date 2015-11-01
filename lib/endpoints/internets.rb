module Endpoints
  class Internets < Base
    namespace "/internets" do
      before do
        content_type :json, charset: 'utf-8'
      end

      def serialize data, structure = :default
        Serializers::Internet.new(structure).serialize(data)
      end

      get do
        encode serialize(Internet.all)
      end

      get "/:id" do |id|
        internet = Internet.find id: id
        encode serialize(internet)
      end

      delete "/:id" do |id|
        internet = Internet.find id: id
        internet.destroy
      end
    end
  end
end
