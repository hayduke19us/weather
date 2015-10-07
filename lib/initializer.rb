module Initializer
  def self.run
    require_config

    require_endpoints
    require_routes
    require_mediators
    require_workers

    require_initializers
    require_models
    require_serializers
  end

  def self.require_config
    require_relative "../config/config"
  end

  def self.require_routes
    require! %w(lib/routes)
  end

  def self.require_models
    require! %w(
      lib/models/**/*
    )
  end

  def self.require_serializers
    require! %w(
      lib/serializers/**/* 
    )
  end

  def self.require_endpoints
    require! %w(
      lib/endpoints/**/*
    )
  end

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

  def self.require_initializers
    Pliny::Utils.require_glob("#{Config.root}/config/initializers/*.rb")
  end

  def self.require!(globs)
    Array(globs).each do |f|
      Pliny::Utils.require_glob("#{Config.root}/#{f}.rb")
    end
  end
end

Initializer.run
