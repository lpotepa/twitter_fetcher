use Mix.Config

config :twitter_fetcher,
  consumer_api_key: System.get_env("CONSUMER_API_KEY"),
  consumer_api_secret: System.get_env("CONSUMER_API_SECRET"),
  access_token: System.get_env("ACCESS_TOKEN"),
  access_token_secret: System.get_env("ACCESS_TOKEN_SECRET")

config :twitter_fetcher, Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: 15
