defmodule UrlShortener1Web.URLController do
  use UrlShortener1Web, :controller

  alias UrlShortener1.SlugGenerator
  alias UrlShortener1.Repo
  alias UrlShortener1.URL
  def create(conn, %{"long_url"=> long_url}) do
    short_url = SlugGenerator.shorten(long_url)

    Repo.insert(%URL{long_url: long_url, short_url: short_url})

    send_resp(conn, 201, short_url)
  end

  def create(conn,_ ) do
    send_resp(conn, 422, "bad request")
  end

  def show(conn, %{"short_url"=> short_url}) do
    long_url =  ConCache.get_or_store(:url_cache, short_url, fn() ->
        %URL{long_url: long_url} = Repo.get_by(URL, short_url: short_url)
          IO.puts("Not working!")
          long_url
      end)
    counter = :ets.whereis(:url_cache)
    :ets.update_counter(counter, "#{short_url}_counter",1,{1,0})
   redirect(conn, external: long_url) |> halt()
  end
end
