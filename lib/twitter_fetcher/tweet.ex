defmodule Tweet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tweets" do
    field(:author, :string)
    field(:retweet_count, :integer)
    field(:text, :string)
    timestamps(inserted_at: :created_at)
  end

  def changeset(tweet, params \\ %{}) do
    tweet
    |> cast(params, [:id, :author, :retweet_count, :text, :created_at])
    |> validate_required([:id, :author, :retweet_count, :text, :created_at])
    |> unique_constraint(:id, name: :tweets_pkey)
  end
end
