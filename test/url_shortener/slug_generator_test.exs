defmodule UrlShortner.SlugGenerator do
  use UrlShortener1.DataCase, async: true

  describe "converts long url into slug" do
    test "recieves a valid long url" do
      long_url = "https://elixirschool.com/en/lessons"

      slug = UrlShortener1.SlugGenerator.shorten(long_url)

      assert is_binary(slug)
      assert String.length(slug) == 6
    end
  end
end
