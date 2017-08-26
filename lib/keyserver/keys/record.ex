defmodule Keyserver.Keys.Record do
  use Ecto.Schema
  import Ecto.Changeset
  alias Keyserver.Keys.Record


	@primary_key {:id, :binary_id, autogenerate: true}
  schema "records" do
    field :key, :map

    timestamps()
  end

  @doc false
  def changeset(%Record{} = record, attrs) do
    record
    |> cast(attrs, [:id, :key])
    |> validate_required([:id, :key])
  end
end
