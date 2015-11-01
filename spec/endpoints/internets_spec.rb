require "spec_helper"

describe Endpoints::Internets do
 include Rack::Test::Methods

  describe "GET /internets" do
    it "succeeds" do
      get "/internets"
      assert_equal 200, last_response.status
    end
  end
end
