class Serializers::User < Serializers::Base
  structure(:default) do |arg|
    {
      created_at: arg.created_at.try(:iso8601),
      id:         arg.id,
      email:       arg.email,
      password:     arg.password,
      updated_at: arg.updated_at.try(:iso8601),
    }
  end
end
