defmodule Mix.Tasks.AddUser do
  use Mix.Task

  @shortdoc "Add new user to the system"

  def run([name]) do
    {:ok, _} = Application.ensure_all_started(:twitter_fetcher)
    %User{} |> User.changeset(%{name: name}) |> Repo.insert()
  end
end
