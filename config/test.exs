use Mix.Config

config :twitter_fetcher, Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  database: "twitter_fetcher_test",
  hostname: "localhost",
  pool_size: 10
