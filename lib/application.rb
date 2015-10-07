require 'bundler'
Bundler.require

require_relative 'initializer'

class AppEnv
  def development?
    Config.pliny_env.match('development') && Config.rack_env.match('development')
  end

  def test?
    Config.pliny_env.match('test') && Config.rack_env.match('test')
  end

  def production?
    Config.pliny_env.match('production') && Config.rack_env.match('production')
  end

  alias_method :pro?, :production?
  alias_method :dev?, :development?
end

