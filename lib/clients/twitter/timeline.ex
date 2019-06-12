defmodule Clients.Twitter.Timeline do
  @behaviour Clients.Twitter

  import Oauth
  use HTTPoison.Base

  def fetch(name, port \\ nil) do
    params = sign("get", url, [{"screen_name", name}])
    {headers, req_params} = OAuther.header(params)

    get(url(port), [headers], params: req_params)
  end

  def url(port \\ nil) do
    case Mix.env() do
      :test -> "http://localhost:#{port}/1.1/statuses/user_timeline.json"
      _ -> "https://api.twitter.com/1.1/statuses/user_timeline.json"
    end
  end

  def process_response_body(body) do
    body
    |> Poison.decode!()
  end
end
