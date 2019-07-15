defmodule UrlShortener1.Repo.Migrations.CreateUrls do
  use Ecto.Migration

  def change do
    create table(:urls) do
      add :long_url, :string
      add :short_url,:string, size: 6
    end
    create unique_index(:urls, [:short_url])
  end
end
