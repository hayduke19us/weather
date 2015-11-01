require 'faye/websocket'
require 'socket'

module WeatherMan
  class WeatherBackend
    KEEPALIVE_TIME = 15 # in seconds

    def initialize(app)
      @app     = app
      @clients = []
      @server = TCPSocket.new('localhost', 3000)
    end

    def listen_to_3000
      @response = Thread.new do
        loop {
          input = @server.gets.chomp
          global_message input if input
        }
      end
      @response.join
    end

    def global_message msg
      @clients.each {|client| client.send(msg)}
    end

    def call(env)
      if Faye::WebSocket.websocket?(env)
        ws = Faye::WebSocket.new(env, nil, {ping: KEEPALIVE_TIME })

        ws.on :open do |event|
          p [:open, ws.object_id]
          @clients << ws
          listen_to_3000
        end

        ws.on :message do |event|
          p [:message, event.data]
          @clients.each {|client| client.send(event.data) }
        end

        ws.on :close do |event|
          p [:close, ws.object_id, event.code, event.reason]
          @clients.delete(ws)
          ws = nil
        end

        ws.rack_response
      else
        @app.call(env)
      end
    end
  end
end
