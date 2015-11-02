require 'bcrypt'

class User < Sequel::Model
  include BCrypt

  plugin :timestamps, update_on_create: true
  plugin :validation_helpers

  def self.create values={}, &block
    user = new(values, &block)
    user.b_password = values[:password]
    user.save
  end

  def self.by_email email
    find email: email
  end

  # Use b_password to change users password
  def b_password=(new_password)
    @password = Password.create(new_password)
    self.password = @password
  end

  def b_password
    @password ||= Password.new(self.password)
  end

  def validate
    super
    validates_presence [:email]
  end

  def self.authenticate params={}
    user = by_email params[:email]
    user if user && user.authenticate_password(params[:password])
  end

  def authenticate_password password
    self.b_password == password ? true : false 
  end
end
