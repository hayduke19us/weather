require "spec_helper"

describe Endpoints::Weathers do
  include Rack::Test::Methods

  describe "GET /weathers" do
    it "succeeds" do
      get "/weathers"
      assert_equal 200, last_response.status
    end
  end

  describe "Post /weathers" do
    it "succeeds" do
      post "/weathers", {current: {temp: 60, rain: 'light', cloud: true}.to_json}
      assert_equal 201, last_response.status
      props = MultiJson.decode(Weather.last.current)
      refute props.empty?
    end
  end

  describe "Get /weathers/:id" do
    it 'succeeds' do
      w = Weather.first.id
      get "/weathers", id: w
      assert_equal 200, last_response.status
    end
  end

  describe "Patch /weathers/:id" do
    it 'sucks' do
      w = Weather.first
      patch "/weathers/#{w.id}", {weather: {current: {temp: 60}.to_json}}
      we = Weather.find id: w.id
      assert_equal 200, last_response.status
      assert_equal JSON.parse(we.current)['temp'], 60
    end
  end
end
