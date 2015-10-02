require "spec_helper"

describe Endpoints::Weathers do
  include Committee::Test::Methods
  include Rack::Test::Methods

  def app
    Routes
  end

  def schema_path
    "./schema/schema.json"
  end

  describe 'GET /weathers' do
    it 'returns correct status code and conforms to schema' do
      get '/weathers'
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'POST /weathers' do
    it 'returns correct status code and conforms to schema' do
      header "Content-Type", "application/json"
      post '/weathers', {}
      assert_equal 201, last_response.status
      assert_schema_conform
    end
  end

  describe 'GET /weathers/:id' do
    it 'returns correct status code and conforms to schema' do
      id = Weather.first.id
      get "/weathers/#{id}"
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'PATCH /weathers/:id' do
    it 'returns correct status code and conforms to schema' do
      w = Weather.create()
      header "Content-Type", "application/json"
      patch "/weathers/#{w.id}", '{}'
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

#  describe 'DELETE /weathers/:id' do
#    it 'returns correct status code and conforms to schema' do
#      delete '/weathers/123'
#      assert_equal 200, last_response.status
#      assert_schema_conform
#    end
#  end
end
