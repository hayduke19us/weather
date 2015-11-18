module Endpoints
  class Root < Base
    get "/" do
      haml :index
    end
  end
end
