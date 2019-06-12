defmodule TwitterFetcher.MixProject do
  use Mix.Project

  def project do
    [
      app: :twitter_fetcher,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {TwitterFetcher.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"},
      {:httpoison, "~> 1.4"},
      {:poison, "~> 3.1"},
      {:oauther, "~> 1.1"},
      {:timex, "~> 3.1"},
      {:bypass, "~> 1.0", only: :test}
    ]
  end
end
