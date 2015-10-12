require "socket"
require "Pathname"
require "json"
require "sequel"
require "colorize"

# Sequel::Model.db = "postgres:///weather-development" || ENV['DATABASE_URL']
DB = Sequel.connect("postgres:///weather-development")
require "./lib/models/weather"


class Server
  attr_reader :connections, :server, :log_path, :log
  def initialize(ip, port)
    @server = TCPServer.open ip, port
    @connections  = Hash.new
    @rooms = Hash.new
    @clients = Hash.new
    @connections[:server] = @server
    @connections[:rooms] = @rooms
    @connections[:clients] = @clients
    @log_path = File.dirname(__FILE__) + 'log.json'
  end

  def run
    loop {
      Thread.start(self.server.accept) do | client |
        client_id = rand(1_000)
        puts "#{client_id} #{client}"
        self.connections[:clients][client_id] = client

        client.puts "Connection established, 
          Thank you for joining! Happy chatting"

        begin
          self.log = {"#{client}" => Time.now}
          puts "Written"
        rescue => e
          puts "something went wrong #{e}"
        end

        self.poll_weather client
        # self.listen_user_messages nick_name, client
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
    self.connections[:clients].each do |handle, other_client|
      unless handle == nick_name
        other_client.puts "#{nick_name.to_s}: #{msg}"
        self.log = { "#{nick_name.to_sym}" => msg }
      end
    end
  end

  def commands? input, client, nickname
    begin 
      if input == 'ls'
        client.puts "Online"
        client.puts  '=-=-=-=--=-=-='
        client.puts self.connections[:clients]
        true
      elsif input.match(/\Ahist/)
        client.puts self.get_history(nickname)
        true
      end
    rescue => e
      puts "something went wrong #{e}"
    end
  end

  def get_history nickname
    begin
      data = File.open(self.log_path, 'r').read
      hash = JSON.parse data
      hash.select(&nickname.to_sym)
    rescue => e
      puts "Something went wrong #{e}"
    end
  end

  def log=(msg)
    File.open self.log_path, 'a' do |f|
      f.write JSON.pretty_generate(msg)
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
