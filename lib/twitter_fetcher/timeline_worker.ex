defmodule TwitterFetcher.TimelineWorker do
  use GenServer

  def start_link(config) do
    GenServer.start_link(__MODULE__, %{twitter_user_name: config[:twitter_user_name]})
  end

  def init(state) do
    send(self(), :fetch)
    {:ok, state}
  end

  def handle_info(:fetch, state) do
    name = state[:twitter_user_name]
    response = Clients.Twitter.Timeline.fetch(name)

    case Clients.Twitter.ResponseHandlers.Timeline.handle(response, name) do
      {:ok, _} -> schedule_fetch()
      {:error, :rate_limit, diff} -> Process.send_after(self(), :fetch, diff * 1000)
      {:error, _} -> nil
    end

    {:noreply, state}
  end

  defp schedule_fetch do
    {interval, ""} = Integer.parse(Application.get_env(:twitter_fetcher, :twitter_fetch_interval))

    Process.send_after(self(), :fetch, 1000 * 60 * interval)
  end
end
