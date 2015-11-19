require "spec_helper"

describe Endpoints::Users do
  include Committee::Test::Methods
  include Rack::Test::Methods
  include Authentication::Test

  def app
    Routes
  end

  def schema_path
    "./schema/schema.json"
  end

  before do
    @user = User.create(email: 'email@gmail.com', password: 'password')
    get '/users/sign_in', email: @user.email, password: 'password'
  end

  describe 'GET /users' do
    it 'returns correct status code and conforms to schema' do
      get '/users'
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'POST /users' do
    it 'returns correct status code and conforms to schema' do
      header "Content-Type", "application/json"
      post '/users', MultiJson.encode(email: 'hayduke', password: 'som')
      assert_equal 201, last_response.status
      assert_schema_conform
    end
  end

  describe 'GET /users/:id' do
    it 'returns correct status code and conforms to schema' do
      get "/users/#{@user.id}"
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'PATCH /users/:id' do
    it 'returns correct status code and conforms to schema' do
      header "Content-Type", "application/json"
      patch "/users/#{@user.id}", {email: 'hound@gmail.com'}.to_json
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'DELETE /users/:id' do
    it 'returns correct status code and conforms to schema' do
      delete "/users/#{@user.id}"
      assert_equal 200, last_response.status
    end
  end
end
