Sequel.migration do
  change do
    alter_table(:weathers) do
      add_column :daily, 'jsonb', default: '{}'
      add_column :hourly, 'jsonb', default: '{}'
    end
  end
end
