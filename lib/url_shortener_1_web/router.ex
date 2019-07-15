defmodule UrlShortener1Web.Router do
  use UrlShortener1Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", UrlShortener1Web do
    pipe_through :api
    post "/short_url", URLController, :create
  end
  get  "/:short_url", UrlShortener1Web.URLController, :show
end
