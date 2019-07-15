defmodule UrlShortener1.URL do
  use Ecto.Schema

  schema "urls" do
    field :long_url
    field :short_url
  end
end
