defmodule Repo do
  use Ecto.Repo,
    otp_app: :twitter_fetcher,
    adapter: Ecto.Adapters.Postgres
end
