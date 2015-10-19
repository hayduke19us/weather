require "pliny/tasks"

def parse_env file
  File.exist?(file) ? Pliny::Utils.parse_env(file) : nil
end

def env type='development'

  env = lambda {
    case type
      when 'test'
        parse_env('.env.test')
      when 'development'
        parse_env('.env')
    end
  }

  ENV['PLINY_ENV'] ? ENV : env.call

end

# Add your rake tasks to lib/tasks!
Dir["./lib/tasks/*.rake"].each { |task| load task }

task :default => :spec
