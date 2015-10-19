Sequel.migration do
  change do
    create_table(:internets) do
      uuid         :id, default: Sequel.function(:uuid_generate_v4), primary_key: true
      timestamptz  :created_at, default: Sequel.function(:now), null: false
      timestamptz  :updated_at, default: Sequel.function(:now), null: false
      String       :name, null: false
      String       :address
      String       :ip
      Integer      :signal
      Integer      :noise
      Integer      :snr
      Float        :signal_quality
    end
  end
end
