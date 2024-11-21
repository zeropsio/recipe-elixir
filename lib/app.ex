defmodule App.Router do
  use Plug.Router
  alias App.Contexts.Entries

  plug :match
  plug Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  plug :dispatch

  # Root route
  get "/" do
    case Entries.create_entry() do
      {:ok, entry} ->
        response = Jason.OrderedObject.new([
          {"message", "This is a simple Elixir application running on Zerops.io, each request adds an entry to the PostgreSQL database and returns a count. See the source repository (https://github.com/zeropsio/recipe-elixir) for more information."},
          {"newEntry", entry.uuid},
          {"count", Entries.count_entries()}
        ])

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, _changeset} ->
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(%{error: "Unable to create entry"}))
    end
  end

  # Status route
  get "/status" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(%{status: "ok"}))
  end

  # Catch-all route for undefined paths
  match _ do
    send_resp(conn, 404, "Not found")
  end
end
