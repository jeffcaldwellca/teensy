require 'sequel'

DB = Sequel.connect('sqlite://db/urls.db')

Sequel.migration do
  up do
    create_table(:urls) do
      primary_key :id
      String :url, :null=>false
    end
  end

  down do
    drop_table(:urls)
  end
end
