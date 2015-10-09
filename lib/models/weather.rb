class Weather < Sequel::Model
  plugin :timestamps, update_on_create: true

  def self.current
    query = %[
    SELECT
      id, current FROM weathers ORDER BY created_at DESC LIMIT 1
    ]

    db[query].first
  end

  def self.daily limit=10
    query = %[
    SELECT
      id, daily FROM weathers ORDER BY created_at DESC LIMIT #{limit}
    ]

    fetch_and_validate query, String, limit
  end

  def self.colder_than temp
    query = %[
    SELECT
      id,
      created_at,
      current -> 'apparentTemperature' AS temperature
      FROM weathers
      WHERE current -> 'apparentTemperature' < '#{temp}'
    ]

    fetch_and_validate query, Float, temp
  end

  def self.hotter_than temp
    query = %[
    SELECT
      id,
      created_at,
      current -> 'apparentTemperature' AS temperature
      FROM weathers
      WHERE current -> 'apparentTemperature' < '#{temp}'
    ]

    fetch_and_validate query, Float, temp
  end

  # Only searches thru top-level keys
  def self.has_key key
    query = %[
      SELECT id, current FROM weathers WHERE current ? '#{key}'
    ]
    fetch_and_validate query, String, key
  end

  def self.fetch_and_validate query, valid, key
    begin
      if key.is_a? valid
        db.fetch(query).all 
      else 
        raise "The wrong type of argument was given"
      end
    rescue => e
      puts e
    end
  end
end
