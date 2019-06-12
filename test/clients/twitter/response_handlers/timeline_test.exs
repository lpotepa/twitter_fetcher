defmodule Clients.Twitter.ResponseHandlers.TimelineTest do
  use ExUnit.Case, async: true
  alias Clients.Twitter.ResponseHandlers.Timeline

  setup do
    Tweet |> Repo.delete_all()
    :ok
  end

  describe ".handle" do
    test 'handles the 200 response and crates new tweets' do
      response = ResponseHelpers.response(200)
      body_length = length(response.body)
      Timeline.handle({:ok, response}, "nasa")
      assert length(Repo.all(Tweet)) == body_length
    end

    test 'handles the 401 response' do
      response = ResponseHelpers.response(401)
      assert Timeline.handle({:ok, response}, "nasa") == {:error, "Unauthorized"}
    end

    test 'handles the 429 response' do
      response = ResponseHelpers.response(429)
      {status, reason, interval} = Timeline.handle({:ok, response}, "nasa")
      assert status == :error
      assert reason == :rate_limit
      assert interval == 100
    end
  end
end
