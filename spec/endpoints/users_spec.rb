require "spec_helper"
require "authentication.rb"

describe Endpoints::Users do
  include Authentication
  include Rack::Test::Methods

  before do
    @user = User.create(email: 'email@gmail.com', password: 'password')
  end

  describe "GET /users" do
    it "succeeds" do
      get "/users"
      assert_equal 200, last_response.status
    end
  end

  describe "GET /users/:id" do
    it "returns a user" do
      get "/users/" + @user.id
      assert_equal 200, last_response.status
    end
  end

  describe "POST /users" do
    it "returns a new user" do
      post "/users", email: 'hayduke@gmail.com', password: 'something'
      assert_equal 201, last_response.status
    end
  end

  describe "PATCH /users/:id" do
    it "returns an edited user" do
      patch "/users/#{@user.id}", email: 'petessausage@gmail.com'
      assert_equal 200, last_response.status
      email = MultiJson.decode(last_response.body)['email']
      puts email
      assert_equal 'petessausage@gmail.com', email
    end
  end

  describe "DELETE /users/:id" do
    it "deletes a user" do
      assert_difference 'User.count', -1 do
        delete "/users/#{@user.id}"
      end
    end
  end

  describe "GET /users/sign_in" do
    it "creates a session for a user" do
      get '/users/sign_in', email: @user.email, password: 'password'

      session = last_request.env['rack.session']
      assert_equal User.by_email(@user.email).id, session[:user_id]
    end

    it 'assigns a current user' do
      get '/users/sign_in', email: @user.email, password: 'password'
      assert current_user
    end
  end
end
