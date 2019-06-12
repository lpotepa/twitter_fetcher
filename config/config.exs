use Mix.Config

config :twitter_fetcher,
  ecto_repos: [Repo],
  ## Fetching interval in minutes
  twitter_fetch_interval: System.get_env("TWITTER_FETCH_INTERVAL") || "1"

import_config "#{Mix.env()}.exs"
