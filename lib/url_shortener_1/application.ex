defmodule UrlShortener1.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the Ecto repository
      UrlShortener1.Repo,
      # Start the endpoint when the application starts
      UrlShortener1Web.Endpoint,
      {ConCache, [name: :url_cache, ttl_check_interval: false]},
      {UrlShortener1.Counter,[name: :counter_cache ]}


      # Starts a worker by calling: UrlShortener1.Worker.start_link(arg)
      # {UrlShortener1.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: UrlShortener1.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    UrlShortener1Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
