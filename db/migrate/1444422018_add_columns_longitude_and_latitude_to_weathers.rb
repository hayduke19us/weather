Sequel.migration do
  change do
    alter_table(:weathers) do
      add_column :longitude, Float, default: -1.0
      add_column :latitude, Float, default: 0.0
    end
  end
end
