use Mix.Config

# Configure your database
config :url_shortener_1, UrlShortener1.Repo,
  # username: "postgres",
  # password: "postgres",
  database: "url_shortener_1_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :url_shortener_1, UrlShortener1Web.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
