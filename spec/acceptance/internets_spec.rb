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

  def internet
    @internet ||= Internet.first
  end

  describe 'GET /internets' do
    it 'returns correct status code and conforms to schema' do
      get '/internets'
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'GET /internets/:id' do
    it 'returns correct status code and conforms to schema' do
      get "/internets/#{internet.id}"
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'DELETE /internets/:id' do
    it 'returns correct status code and conforms to schema' do
      delete "/internets/#{internet.id}"
      assert_equal 200, last_response.status
    end
  end
end
