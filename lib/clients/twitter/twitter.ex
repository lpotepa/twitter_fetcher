defmodule Clients.Twitter do
  @callback fetch(String.t()) :: {:ok, term} | {:error, String.t()}
  @callback url(String.t()) :: String.t()
end
