require "socket"
require "json"
require "colorize"

Sequel.connect(database_urls.last)
require "./lib/models/weather"

class Server
  attr_reader :connections, :server, :log_path, :log
  def initialize(ip, port)
    @server = TCPServer.open ip, port
    @connections  = Hash.new
    @clients      = Hash.new
    @connections[:server] = @server
    @connections[:clients] = @clients
    @log_path = File.dirname(__FILE__) + 'log.json'
  end

  def run
    loop {
      Thread.start(self.server.accept) do | client |
        client_id = rand(1_000)
        puts "#{client_id} #{client}"
        self.connections[:clients][client_id] = client

        self.poll_weather client
      end
    }
  end

  def poll_weather client
    # 'old' needs to stay out side of the loop and
    # is reset each time regardless.
    old = Weather.current
    loop {
      current = Weather.current
      state = weather_diff?(old, current) ? 1 : 0
      message client, state
      old = current
    }
  end

  def weather_diff? old, current
    old[:id] != current[:id]
  end

  def message client, state
    client.puts state if state > 0
  end

  def connections?
    self.connections[:clients].count > 1
  end

  def send_global_msg msg, nick_name
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
