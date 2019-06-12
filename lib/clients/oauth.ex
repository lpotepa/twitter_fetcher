defmodule Oauth do
  def credentials do
    OAuther.credentials(
      consumer_key: Application.get_env(:twitter_fetcher, :consumer_api_key),
      consumer_secret: Application.get_env(:twitter_fetcher, :consumer_api_secret),
      token: Application.get_env(:twitter_fetcher, :access_token),
      token_secret: Application.get_env(:twitter_fetcher, :access_token_secret)
    )
  end

  def sign(method, url, params \\ []) do
    OAuther.sign(
      method,
      url,
      params,
      credentials
    )
  end
end
