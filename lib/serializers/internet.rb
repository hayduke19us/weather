class Serializers::Internet < Serializers::Base
  structure(:default) do |arg|
    {
      created_at: arg.created_at.try(:iso8601),
      id:         arg.id,
      name:       arg.name,
      address:    arg.address,
      ip:         arg.ip,
      signal:     arg.signal,
      noise:      arg.noise,
      snr:        arg.snr,
      signal_quality: arg.signal_quality.round(4),
      updated_at: arg.updated_at.try(:iso8601),
    }
  end
end
