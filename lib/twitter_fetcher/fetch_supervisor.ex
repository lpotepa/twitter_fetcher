defmodule TwitterFetcher.FetchSupervisor do
  use Supervisor

  def start_link(init_arg) do
    Supervisor.start_link(__MODULE__, init_arg, name: __MODULE__)
  end

  def init(_) do
    users = User |> Repo.all()

    children =
      users
      |> Enum.map(fn user ->
        Supervisor.child_spec({TwitterFetcher.TimelineWorker, twitter_user_name: user.name},
          id: user.name
        )
      end)

    Supervisor.init(children, strategy: :one_for_one)
  end
end
