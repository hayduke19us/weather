module Endpoints
  class Users < Base

    namespace "/users" do
      before do
        content_type :json, charset: 'utf-8'
      end

      def serialize data, structure = :default
        Serializers::User.new(structure).serialize(data)
      end

      get '/sign_in' do
        user = User.authenticate params
        if user
          session[:user_id] = user.id
          status 200
        else
          status 401
        end
      end

      post '/sign_up' do
        if confirm_password body_params[:password], body_params[:password_confirm]
          hash = remove(body_params, 'password_confirm')
          user = User.create hash
          session[:user_id] = user.id if user
        end
      end

      get do
        if session 
          session
        else
          'NO SESSION'
        end
        # status 200
        # encode serialize(User.all)
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

    private 
      def remove hash, value
        hash.tap {|h| h.delete(value)}
      end
  end
end
