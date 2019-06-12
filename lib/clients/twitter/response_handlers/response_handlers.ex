defmodule Clients.Twitter.ResponseHandlers do
  @callback handle(term, String.t()) :: {:ok, term} | {:error, term, term}
end
