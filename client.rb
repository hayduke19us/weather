require 'socket'
require 'colorize'

@server = TCPSocket.new('localhost', 3000)

def listen
  @response = Thread.new do
    loop {
      input = @server.gets.chomp
      puts "#{input}".colorize(:green)
    }
  end
end

listen
@response.join
