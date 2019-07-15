defmodule UrlShortener1.SlugGenerator do
  def shorten(long_url) do
    :md5
    |> :crypto.hash(long_url)
    |> Base.encode16()
    |> String.slice(0..5)
  end
end
