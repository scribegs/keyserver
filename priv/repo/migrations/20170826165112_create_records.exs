defmodule Keyserver.Repo.Migrations.CreateRecords do
  use Ecto.Migration

  def change do
		create table(:records, primary_key: false) do
			add :id, :binary_id, primary_key: true
      add :key, :map

      timestamps()
    end
  end
end
