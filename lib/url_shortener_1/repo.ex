defmodule UrlShortener1.Repo do
  use Ecto.Repo,
    otp_app: :url_shortener_1,
    adapter: Ecto.Adapters.Postgres
end
