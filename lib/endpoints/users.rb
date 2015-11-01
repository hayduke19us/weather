module Endpoints
  class Users < Base
    namespace "/users" do
      before do
        content_type :json, charset: 'utf-8'
      end

      def serialize data, structure = :default
        Serializers::User.new(structure).serialize(data)
      end

      get do
        status 200
        encode serialize(User.all)
      end

      post do
        status 201
        user = User.new(body_params)
        encode serialize(user.save)
      end

      get "/:id" do |id|
        encode serialize(User.find id: id)
      end

      patch "/:id" do |id|
        user = User.find id: id
        encode serialize(user.update(body_params))
      end

      delete "/:id" do |id|
        user = User.find id: id
        encode serialize(user.destroy)
      end
    end
  end
end
