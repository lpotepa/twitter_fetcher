defmodule Clients.Twitter.RateLimitHandler do
  def get_interval(headers) do
    {reset_timestamp, ""} =
      headers
      |> Enum.into(%{})
      |> Map.get("x-rate-limit-reset", "0")
      |> Integer.parse()

    current_timestamp = :os.system_time(:seconds)
    abs(reset_timestamp - current_timestamp)
  end
end
