require 'multi_json'
require 'yaml'
require 'colorize'

def _DB
  Sequel::DATABASES.last
end

def reset_count
  @counter = 0
end

def count_1
  @counter += 1
end

def counter
  @counter
end

def create_internets
  reset_count

  rand_names.each do |person|
    count_1
    id = _DB[:internets].insert(name: person,
                                 address: "*************#{rand(100)}",
                                 ip: rand_ip,
                                 signal: rand(-100),
                                 noise: rand(100),
                                 snr: rand(100),
                                 signal_quality: rand(0.1..1.0)
                                 )
    print_message 'Internet', id
  end

end

def rand_names
  YAML.load_file './db/names.yaml' if File.exist? './db/names.yaml'
end

def rand_ip
  [rand(200), rand(200), rand(200), rand(200)].join('.')
end

def create_weathers
  reset_count

  100.times do
    count_1
    id = _DB[:weathers].insert(current: current,
                               hourly: hourly,
                               daily: daily,
                               longitude: -120.000,
                               latitude: 42.452)
    print_message 'Weather', id
  end
end

def current
  MultiJson.encode(temp: rand(0..100), rain: rnd_weight, cloudy: rnd_bool)
end

def hourly
  MultiJson.encode(temp: rand(0..100), rain: rnd_weight, cloudy: rnd_bool)
end

def daily
  MultiJson.encode(temp: rand(0..100), rain: rnd_weight, cloudy: rnd_bool)
end

def rnd_weight
  weight = %w[light medium heavy]
  weight[rand(0..2)]
end

def rnd_bool
  bools = [true, false]
  bools[rand(0..1)]
end

def create_users
  rand_names.each do |person|
    id = _DB[:users].insert(email: "#{person}@gmail.com", password: SecureRandom.hex)
    print_message 'User', id
  end
end

def print_message klass, id=nil
  if id
    # puts success_message klass
  else
    puts falure_message klass
  end
end

def success_message klass
  %[
     #{counter}. Created a new #{klass}.\n
   ].colorize(:green)
end

def failure_message klass
  %[
     #{counter} There has been an error trying to create a #{klass}
   ].colorize(:red)
end

create_weathers
create_internets
create_users
_DB.disconnect
