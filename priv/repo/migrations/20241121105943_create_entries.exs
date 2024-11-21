defmodule App.Repo.Migrations.CreateEntries do
  use Ecto.Migration

  def change do
    create table(:entries) do
      add :uuid, :string, null: false
      timestamps()
    end
  end
end
