defmodule Clients.Twitter.TimelineTest do
  use ExUnit.Case, async: true

  setup do
    bypass = Bypass.open()
    Tweet |> Repo.delete_all()
    {:ok, bypass: bypass}
  end

  test "client hits the rate limit", %{bypass: bypass} do
    Bypass.expect(bypass, fn conn ->
      assert conn.request_path == "/1.1/statuses/user_timeline.json"

      Plug.Conn.resp(conn, 429, ~s<{"errors": [{"code": 88, "message": "Rate limit exceeded"}]}>)
      |> Plug.Conn.put_resp_header(
        "x-rate-limit-reset",
        Integer.to_string(:os.system_time(:seconds) + 100)
      )
    end)

    {status, response} = Clients.Twitter.Timeline.fetch("nasa", bypass.port)
    assert status == :ok
  end

  test "clients receives a 200 status", %{bypass: bypass} do
    json = File.read!("test/clients/twitter/support/timeline_200.json")

    Bypass.expect(bypass, fn conn ->
      assert conn.request_path == "/1.1/statuses/user_timeline.json"
      Plug.Conn.resp(conn, 200, json)
    end)

    {status, response} = Clients.Twitter.Timeline.fetch("nasa", bypass.port)
    assert status == :ok
  end

  test "clients sends incorrect api keys", %{bypass: bypass} do
    Bypass.expect(bypass, fn conn ->
      assert conn.request_path == "/1.1/statuses/user_timeline.json"

      Plug.Conn.resp(
        conn,
        401,
        ~s<{"errors": [{"code": 215, "message": "Bad Authentication data."}]}>
      )
    end)

    {status, response} = Clients.Twitter.Timeline.fetch("nasa", bypass.port)
    assert status == :ok
  end
end
