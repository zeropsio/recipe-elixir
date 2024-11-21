defmodule App.MixProject do
  use Mix.Project

  def project do
    [
      app: :app,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {App.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
defp deps do
  [
    {:plug_cowboy, "~> 2.6"}, # For Plug and HTTP server
    {:jason, "~> 1.4"},       # For JSON encoding/decoding
    {:ecto_sql, "~> 3.10"},   # For working with databases
    {:postgrex, "~> 0.17"}    # PostgreSQL driver
  ]
end
end
