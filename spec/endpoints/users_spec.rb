require "spec_helper"

describe Endpoints::Users do
  include Rack::Test::Methods
  before do
    @user = User.first
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

  describe "POST" "/users" do
    it "returns a new user" do
      post "/users", {email: 'hayduke@gmail.com', password: 'something'}
      assert_equal 201, last_response.status
    end
  end

  describe "PATCH" "/users/:id" do
    it "returns an edited user" do
      patch "/users/#{@user.id}", {email: 'petessausage@gmail.com'}
      assert_equal 200, last_response.status
      email = MultiJson.decode(last_response.body)['email']
      assert_equal 'petessausage@gmail.com', email
    end
  end

  describe "DELETE" "/users/:id" do
    it "deletes a user" do
      assert_difference 'User.count', -1 do
        delete "users/#{@user.id}"
      end
    end
  end
end
