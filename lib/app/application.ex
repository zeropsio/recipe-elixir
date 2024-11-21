defmodule App.Application do
  use Application

  def start(_type, _args) do
    children = [
      # Start the Cowboy HTTP server
      {Plug.Cowboy, scheme: :http, plug: App.Router, options: [port: 4000]},

      # Start the Ecto repository
      App.Repo
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
