class Serializers::Weather < Serializers::Base
  structure(:default) do |arg|
    {
      created_at: arg.created_at.try(:iso8601),
      id:         arg.id,
      updated_at: arg.updated_at.try(:iso8601),
      current: arg.current
    }
  end
end
