# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the
# db with db:setup).
#
# Seeding can occur multiple times during the execution of a single Rake task
# because seeding should occur in all environments (development, testing,
# etc.). The currently connected database can be accessed via
# `Sequel::DATABASES.last`.

require 'multi_json'
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

def create_weathers
  reset_count
  100.times do
    count_1
    _DB[:weathers].insert(current: current,
                         hourly: hourly,
                         daily: daily,
                         longitude: -120.000,
                         latitude: 42.452)
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

def print_message obj
  if obj
    success_message obj
  else
    falure_message obj
  end
end

def success_message obj
  %[
     #{counter}. Created a new weather.\n
     id: #{obj[:id]}
     current: #{obj[:current]}
   ].colorize(:green)
end

def failure_message obj
  %[
     #{counter} There has been an error
   ].colorize(:red)
end

create_weathers
