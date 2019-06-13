defmodule Clients.Twitter.ResponseHandlers.Timeline do
  @behaviour Clients.Twitter.ResponseHandlers
  def handle({:ok, %{status_code: 200, body: body}}, name), do: handle_tweets_data(body, name)

  def handle({:ok, %{status_code: 429, headers: headers}}, name),
    do: handle_rate_limit(headers, name)

  def handle({:ok, %{status_code: 401}}, _),
    do: handle_unauthorized()

  def handle({:ok, %{status_code: status_code}}, _),
    do: {:error, "Error: status_code: #{status_code}"}

  def handle({:error, %{reason: reason}}, _), do: {:error, reason}

  defp handle_unauthorized do
    IO.puts("Failed to authorize user. Check your API keys.")
    {:error, "Unauthorized"}
  end

  defp handle_rate_limit(headers, name) do
    diff = Clients.Twitter.RateLimitHandler.get_interval(headers)
    IO.puts("Waiting #{diff} seconds to reset for fetching #{name} timeline")
    {:error, :rate_limit, diff}
  end

  defp handle_tweets_data(body, name) do
    data =
      body
      |> Enum.map(fn tweet ->
        %{
          id: tweet["id"],
          author: get_in(tweet, ["user", "name"]),
          retweet_count: tweet["retweet_count"],
          created_at:
            Timex.parse!(tweet["created_at"], "%a %b %d %H:%M:%S %z %Y", :strftime)
            |> Timex.to_naive_datetime(),
          text: tweet["text"]
        }
      end)

    Enum.each(data, fn tweet ->
      case %Tweet{} |> Tweet.changeset(tweet) |> Repo.insert() do
        {:ok, tweet} ->
          {:ok, tweet}

        {:error, changeset} ->
          IO.inspect(Ecto.Changeset.traverse_errors(changeset, & &1))
          {:error, "Validation error"}
      end
    end)

    {:ok, "Succesfully fetched current timeline for #{name}"}
  end
end
