module Initializer
  def self.run
    require_config
    require_lib
    require_initializers
    require_models
  end

  def self.require_config
    require_relative "../config/config"
  end

  def self.require_lib
    require! %w(
      lib/endpoints/base
      lib/endpoints/**/*
      lib/mediators/base
      lib/mediators/**/*
      lib/workers/base
      lib/workers/**/*
      lib/routes
      lib/serializers/base
      lib/serializers/**/*
    )
  end

  def self.require_models
    require! %w(
      lib/models/**/*
    )
  end

  def self.require_initializers
    Pliny::Utils.require_glob("#{Config.root}/config/initializers/*.rb")
  end

  # TODO parse all of lib requires
  def self.require_mediators
    require! %w(
      lib/mediators/**/*
    )
  end

  def self.require_workers
    require! %w(
      lib/workers/**/*
    )
  end

  def self.require!(globs)
    Array(globs).each do |f|
      Pliny::Utils.require_glob("#{Config.root}/#{f}.rb")
    end
  end
end

Initializer.run
