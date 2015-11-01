class User < Sequel::Model
  plugin :timestamps, update_on_create: true
  plugin :validation_helpers

  def validate
    super
    validates_presence [:email, :password]
  end
end
