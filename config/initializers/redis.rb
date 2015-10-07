require 'colorize'

# Starts redis if it is not running
begin

  if `redis-cli ping`.match(/PONG/)
    puts "Redis is already running".colorize(:green)
  else
    `redis-server`
  end

rescue => e
  puts "There has been an error starting redis #{e}".colorize(:red)
end
