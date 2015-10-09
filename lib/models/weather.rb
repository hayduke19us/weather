class Weather < Sequel::Model
  plugin :timestamps, update_on_create: true

  def self.colder_than temp
    query = %[
      SELECT current FROM weathers WHERE current -> 'temp' < '#{temp}'
    ]
    fetch_and_validate query, Float, temp
  end

  def self.hotter_than temp
    query = %[
      SELECT current FROM weathers WHERE current -> 'temp' > '#{temp}'
    ]
    fetch_and_validate query, Float, temp
  end

  # Only searches thru top-level keys 
  def self.has_key key 
    query = %[
      SELECT current FROM weathers WHERE current ? '#{key}'
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
