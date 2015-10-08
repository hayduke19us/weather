module Endpoints
  class Root < Base
    get "/" do
      @tz =TZInfo::Timezone.get('America/Los_Angeles')
      haml :index
    end
  end
end
