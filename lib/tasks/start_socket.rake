require "socket"
require "json"
require "colorize"
require 'securerandom'

class Server
  attr_reader :connections, :server

  def initialize(ip, port)
    @server = TCPServer.open ip, port
    @connections  = Hash.new
    @clients      = Hash.new
    @connections[:server] = @server
    @connections[:clients] = @clients
  end

  def run
    loop {
      Thread.start(self.server.accept) do | client |
        client_id = SecureRandom.uuid

        puts "#{client_id}: #{client}"

        self.connections[:clients][client_id] = client

        self.poll_weather client
      end
    }
  end

  def poll_weather client
    begin
      # 'old' needs to stay out side of the 
      # loop and is reset each time regardless.
      old = current_weather_id
      loop {
        current = current_weather_id
        state = weather_diff?(old, current) ? 1 : 0
        message client, state
        old = current
      }
    rescue => e
      puts e.message
    end
  end

  def weather_diff? old, current
    old != current
  end

  # A connection to the DB is established and disconnected
  def current_weather_id
    query = %[
      SELECT
      id FROM weathers ORDER BY created_at DESC LIMIT 1
    ]

    db = Sequel.connect env['DATABASE_URL']

    if db[:weathers].count > 0
      id = db[query].first[:id]

      db.disconnect
      return id
    else
      db.disconnect
      return 0
    end
  end

  def message client, state
    client.puts state if state > 0
  end

  def connections?
    self.connections[:clients].count > 1
  end

  def send_global_msg msg 
    self.connections[:clients].each do |id, connection|
      connection.puts msg
    end
  end
end

# (ip, port) in each machine "localhost" = 127.0.0.1

desc "Start a socket server"
namespace :socket do
  task :start do
    server = Server.new("localhost", 3000) 
    server.run
  end
end
