module Endpoints
  class Root < Base
    get "/" do
      @tz =TZInfo::Timezone.get('America/Los_Angeles') 
      haml :index, locals: {weathers: Weather.all}
    end
  end
end
