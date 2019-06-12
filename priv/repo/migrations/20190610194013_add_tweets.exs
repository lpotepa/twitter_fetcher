defmodule Repo.Migrations.AddTweets do
  use Ecto.Migration

  def change do
    create table(:tweets) do
      add(:author, :string)
      add(:text, :text)
      add(:retweet_count, :integer)
      timestamps(inserted_at: :created_at)
    end
  end
end
