require "spec_helper"

describe Endpoints::Internets do
  include Committee::Test::Methods
  include Rack::Test::Methods

  def app
    Routes
  end

  def schema_path
    "./schema/schema.json"
  end

  describe 'GET /internets' do
    it 'returns correct status code and conforms to schema' do
      get '/internets'
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'POST /internets' do
    it 'returns correct status code and conforms to schema' do
      header "Content-Type", "application/json"
      post '/internets', MultiJson.encode({})
      assert_equal 201, last_response.status
      assert_schema_conform
    end
  end

  describe 'GET /internets/:id' do
    it 'returns correct status code and conforms to schema' do
      get "/internets/123"
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'PATCH /internets/:id' do
    it 'returns correct status code and conforms to schema' do
      header "Content-Type", "application/json"
      patch '/internets/123', MultiJson.encode({})
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'DELETE /internets/:id' do
    it 'returns correct status code and conforms to schema' do
      delete '/internets/123'
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end
end
