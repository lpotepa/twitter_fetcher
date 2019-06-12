import Mix.Config

config :twitter_fetcher, Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  database: "twitter_fetcher_dev",
  hostname: "localhost",
  pool_size: 10

import_config "dev.secret.exs"
