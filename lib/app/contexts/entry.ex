defmodule App.Contexts.Entry do
  use Ecto.Schema
  import Ecto.Changeset

  schema "entries" do
    field :uuid, :string
    timestamps()
  end

  @doc false
  def changeset(entry, attrs) do
    entry
    |> cast(attrs, [])
    |> put_change(:uuid, Ecto.UUID.generate()) # Generate a UUID
  end
end
