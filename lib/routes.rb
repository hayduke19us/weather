Routes = Rack::Builder.new do
  use SimpleSession::Session, secret: Config.cookie_secret, max_age: 20
  use Rollbar::Middleware::Sinatra
  # I have to comment this out for react
  # use Pliny::Middleware::CORS
  use Pliny::Middleware::RequestID
  use Pliny::Middleware::RescueErrors, raise: Config.raise_errors?
  use Pliny::Middleware::RequestStore, store: Pliny::RequestStore
  use Rack::Timeout if Config.timeout > 0
  use Pliny::Middleware::Versioning,
      default: Config.versioning_default,
      app_name: Config.versioning_app_name if Config.versioning?
  use Rack::Deflater
  use Rack::MethodOverride
  use Rack::SSL if Config.force_ssl?

  use Pliny::Router do
    mount Endpoints::Users
    mount Endpoints::Weathers
    mount Endpoints::Internets
  end

  # root app; but will also handle some defaults like 404
  run Endpoints::Root
end
