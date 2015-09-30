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
      puts props
    end
  end
end
