defmodule App.Contexts.Entries do
  alias App.Repo
  alias App.Contexts.Entry

  def create_entry do
    %Entry{}
    |> Entry.changeset(%{})
    |> Repo.insert()
  end

  def count_entries do
    Repo.aggregate(Entry, :count, :id)
  end
end
