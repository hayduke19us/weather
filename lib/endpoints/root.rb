module Endpoints
  class Root < Base
    get "/" do
      haml :index, locals: {weathers: Weather.all}
    end
  end
end
