import Config

config :app, App.Repo,
  url: System.get_env("DATABASE_URL") || raise("DATABASE_URL environment variable is not set"),
  pool_size: 10

config :app, ecto_repos: [App.Repo]
