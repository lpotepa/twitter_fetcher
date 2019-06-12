ExUnit.start()
Application.ensure_all_started(:bypass)

Enum.each(Path.wildcard("./test/clients/twitter/*.exs"), fn file ->
  IO.puts(file)
  Code.require_file(file)
end)

Enum.each(Path.wildcard("./test/clients/twitter/response_handlers/*.exs"), fn file ->
  IO.puts(file)
  Code.require_file(file)
end)

Code.require_file("./test/clients/twitter/support/response_helpers.exs")
