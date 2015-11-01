require "spec_helper"

describe Endpoints::Weathers do
  include Rack::Test::Methods

  describe "GET /weathers" do
    it "succeeds" do
      get "/weathers"
      assert_equal 200, last_response.status
    end
  end

  describe "GET /weathers/:id" do
    it 'succeeds' do
      w = Weather.first.id
      get "/weathers/#{w}"
      assert_equal 200, last_response.status
    end
  end

  describe "GET /weathers/daily/:limit" do
    it 'returns a collection limited by params' do
      get "/weathers/daily/3"
      size = MultiJson.decode(last_response.body).count
      assert_equal 3, size
    end
  end

end
