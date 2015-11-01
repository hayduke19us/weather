module Endpoints

  # The base class for all Sinatra-based endpoints. Use sparingly.
  class Base < Sinatra::Base

    register Pliny::Extensions::Instruments
    register Sinatra::Namespace

    helpers Pliny::Helpers::Encode
    helpers Pliny::Helpers::Params

    set :html, :format => :html
    set :haml, :format => :html5
    set :dump_errors, false
    set :raise_errors, true
    set :root, Config.root
    set :show_exceptions, false

    configure :development do
      register Sinatra::Reloader
      also_reload '../**/*.rb'
    end

    configure do
      set :sessions, true
    end

    # For the preflight request
    options '/*' do
      if Config.pliny_env =~ /\A(development|test)/

        response.headers["Access-Control-Allow-Origin"] = "http://localhost:8080"
        response.headers["Access-Control-Allow-Methods"] = "GET"
        response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, Content-Type"

        200
      end
    end

    error Sinatra::NotFound do
      raise Pliny::Errors::NotFound
    end
  end
end
