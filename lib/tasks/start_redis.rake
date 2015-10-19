require 'colorize'
require 'redis'

# Starts redis if it is not running
def start_redis
  begin

    if `pgrep 'redis'`.empty?
      `redis-server`
    else
      grep = `pgrep 'redis'`
      puts "Redis is already running".colorize(:green)
      puts "Check out these process id's #{grep}"
    end

  end
end

desc 'Starts redis if ENV["PLINY_ENV"] == development or test meant for development'
namespace :redis do
  task :start do
    if env['PLINY_ENV'].match('development')
      start_redis
    end
  end

  task :stop do
    begin

    if `redis-cli ping`.empty?
      puts "Redis is not running".colorize(:red)
    else
      `redis-cli shutdown`
      puts "Redis has been shut down".colorize(:green)
    end

    rescue => e
      puts e.message
    end
  end

  task :kill_all do
    grep = `pgrep 'redis'`.split(' ')
    puts "Found #{grep.count} process' to kill".colorize(:green)
    if grep.any?
      puts "Now killing #{ grep.each { |p| puts p }}".red
      grep.each {|pid| `kill -9 #{pid}`}
    end
  end
end

