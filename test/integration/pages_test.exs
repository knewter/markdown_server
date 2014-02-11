defmodule Integration.PagesTest do
  use IntegrationTest.Case

  test "renders an index of available files" do
    body = get("/pages")
    assert Regex.match?(%r/Index of markdown files/, body)
    assert Regex.match?(%r/basic/, body)
    assert Regex.match?(%r/middling/, body)
    refute Regex.match?(%r/notmd.blergh/, body)
  end
end
